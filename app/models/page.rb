class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :children, :class_name => "Page", :foreign_key => "parent_id"

  def has_children?
    if children.count > 0 
      true
    else
      false
    end
  end
end
