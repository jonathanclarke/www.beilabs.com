# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def nice_date(date)
    date.strftime('%d %B, %Y')
  end
end
