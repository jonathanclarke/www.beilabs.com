module ApplicationHelper
  def nice_date(date)
    date.strftime('%d %B, %Y')
  end
end
