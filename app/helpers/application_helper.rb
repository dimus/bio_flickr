# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  def render_flash
    output = []

    for value in flash[:error]
      output << "<span class=\"error\">#{value}</span>"
    end if flash && flash[:error]

    for value in flash[:notice]
      output << "<span class=\"notice\">#{value}</span>"
    end if flash && flash[:notice]

    flash[:error] = []
    flash[:notice] = []

    output.join("<br/>\n")
  end

end
