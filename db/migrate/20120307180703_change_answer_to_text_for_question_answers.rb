class ChangeAnswerToTextForQuestionAnswers < ActiveRecord::Migration
  def up
    change_column :question_answers, :answer, :text
  end

  def down
    change_column :question_answers, :answer, :string
  end
end
