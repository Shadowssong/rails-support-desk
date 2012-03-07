class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.string :question
      t.string :answer
      t.integer :category_id

      t.timestamps
    end
  end
end
