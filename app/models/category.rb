class Category < ActiveRecord::Base
  has_many  :question_answers, :dependent => :destroy
  extend FriendlyId
  friendly_id :title, use: :slugged

end
