class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.boolean :active, :default => true
      t.string :from
      t.string :title
      t.string :permalink
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
