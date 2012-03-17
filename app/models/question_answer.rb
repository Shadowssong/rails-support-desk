class QuestionAnswer < ActiveRecord::Base
  belongs_to  :category
  validates_presence_of :category_id
  validates :question, :presence => true
  validates :answer, :presence => true
  scope :most_recent, :order => "updated_at desc", :limit => 3 
  scope :top_viewed, :order => "views desc", :limit => 5 
end
