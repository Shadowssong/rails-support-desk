require 'spec_helper'

describe Category do
  before(:each) do 
    @category = Category.create(:title => "test")
    @qa = @category.question_answers.build(:question => "f", :answer => "f").save
  end
  context "destroying dependents"  do
    it "should destroy all children" do
      @category.question_answers.count.should == 1
      @category.destroy
      @category.question_answers.count.should == 0
    end
  end
end


