require 'spec_helper'

describe "question_answers/index" do
  before(:each) do
    assign(:question_answers, [
      stub_model(QuestionAnswer,
        :question => "Question",
        :answer => "Answer",
        :category_id => 1
      ),
      stub_model(QuestionAnswer,
        :question => "Question",
        :answer => "Answer",
        :category_id => 1
      )
    ])
  end

  it "renders a list of question_answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
