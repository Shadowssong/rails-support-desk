class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :children, :class_name => "Page", :foreign_key => "parent_id"
  scope :find_parents, where(:parent_id => nil)

  has_many :attachments, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments

  def has_children?
    if children.count > 0 
      true
    else
      false
    end
  end
end
