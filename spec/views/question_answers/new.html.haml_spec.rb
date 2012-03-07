require 'spec_helper'

describe "question_answers/new" do
  before(:each) do
    assign(:question_answer, stub_model(QuestionAnswer,
      :question => "MyString",
      :answer => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new question_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_answers_path, :method => "post" do
      assert_select "input#question_answer_question", :name => "question_answer[question]"
      assert_select "input#question_answer_answer", :name => "question_answer[answer]"
      assert_select "input#question_answer_category_id", :name => "question_answer[category_id]"
    end
  end
end
