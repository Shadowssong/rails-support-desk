require 'spec_helper'
describe User do
  before(:each) do
    @user = User.create(:password => "test123", :password_confirmation => "test123", :email => "test@example.com")
  end
  context "Who can become an admin" do
    it "should not allow mass assignment of is_admin" do
      expect { @user.update_attributes(:is_admin => true) }.should raise_error (ActiveModel::MassAssignmentSecurity::Error)
    end
    it "should show me an admin" do
      @user.is_admin = true
      @user.save
      @user.is_admin?.should be_true
    end

    it "should say a regular user is not an admin" do
      @user.is_admin?.should be_false
    end
  end
end
