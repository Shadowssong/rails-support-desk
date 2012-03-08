require 'spec_helper'

describe Page do
  before(:each) do
    @page = Page.create(:title => "foobar", :parent_id => nil)
  end

  context "Pages having children" do
    it "should return true if a page has children" do
      # hereo
      # so this would ust create a page, no need to assign it to a varaible
      # if you do @page then it will overwrite the class variable set in the before part
      # so now set the parent id to the @page id
      Page.create(:title => "fewbar", :parent_id => @page.id)
      @page.has_children?.should be_true
    end
    it "should return false if a page has no children" do
      @page.has_children?.should be_false
    end
  end
end
