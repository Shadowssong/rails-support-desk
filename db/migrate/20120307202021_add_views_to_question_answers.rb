class AddViewsToQuestionAnswers < ActiveRecord::Migration
  def change
    add_column :question_answers, :views, :integer, :default => 0

  end
end
