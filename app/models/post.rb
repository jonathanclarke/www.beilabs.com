require 'net/http'
require 'net/imap'
require 'mail'

class Post < ActiveRecord::Base

  FOLDERS = { 'INBOX' => 'INBOX' }

  before_update :set_permalink
  before_save :set_permalink

  named_scope :latest, :order => "created_at DESC", :limit => 5

  def set_permalink
    self.permalink = "#{ rand(Time.zone.now.to_i) }-#{ (title.downcase.gsub(/[^a-z0-9]+/i, '-')) }"
  end

  def to_param
    permalink
  end

  #Fetch unread emails and insert them into the database.
  def self.fetch
    puts "Connecting..."

    source = Net::IMAP.new(Configuration.source_host, Configuration.source_port, Configuration.source_ssl)

    puts "Logging in..."
    source.login(Configuration.source_user, Configuration.source_pass)

    begin
      puts "Selecting Inbox..."
      source.select('INBOX')
      source.search(["NOT", "DELETED"]).each do |message_id|
        msg = source.fetch(message_id, "RFC822")[0].attr["RFC822"]
        Post.insert(msg)

        source.copy(message_id, 'COMPLETE')
        puts "Message moved to COMPLETE"
        source.store(message_id, "+FLAGS", [:Deleted]) if RAILS_ENV=="production"
      end
    rescue => e
      puts "Error: #{ e }"
    end

    source.close
    source.disconnect
  end

  #Insert the email into the database
  def self.insert(msg)
    puts "Displaying the message"
    mail = Mail.new(msg)

    @post = Post.new
    @post.title = mail.subject
    @post.from = mail.from
    @post.content = mail.html_part.body

    begin
      @post.save
      puts "#{ @post.title } was created!"
    rescue => e
      puts "Error: #{ e }"
    end
  end
end
