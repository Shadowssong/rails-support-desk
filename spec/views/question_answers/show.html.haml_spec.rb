require 'spec_helper'

describe "question_answers/show" do
  before(:each) do
    @question_answer = assign(:question_answer, stub_model(QuestionAnswer,
      :question => "Question",
      :answer => "Answer",
      :category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Answer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
