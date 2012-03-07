module CategoriesHelper
  def categories_for_select
   Category.all.collect {|c| [c.title, c.id]}
  end
end
