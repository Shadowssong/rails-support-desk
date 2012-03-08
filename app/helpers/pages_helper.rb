module PagesHelper
  def display_children(p)
    output = "<ul>"
    p.children.each do |page|
      output << "<li>" + link_to(page.title, page) + "</li>"
    end
    output << "</ul>"

    raw output
  end
end
