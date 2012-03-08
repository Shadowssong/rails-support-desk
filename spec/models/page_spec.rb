require 'spec_helper'

describe Page do
  before(:each) do
    @page = Page.create(:title => "foobar", :parent_id => nil)
  end

  context "Page scope for showing as something that can be marked as parent" do
    it "should show a page that can be a parent" do
      Page.find_parents.include?(@page).should be_true
    end
    it "should not show a page as a parent that is a child" do
      @page.parent_id = 1
      @page.save
      Page.find_parents.include?(@page).should be_false
    end
  end

  context "Pages having children" do
    it "should return true if a page has children" do
      Page.create(:title => "fewbar", :parent_id => @page.id)
      @page.has_children?.should be_true
    end
    it "should return false if a page has no children" do
      @page.has_children?.should be_false
    end
  end
end
