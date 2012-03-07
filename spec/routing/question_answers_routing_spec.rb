require "spec_helper"

describe QuestionAnswersController do
  describe "routing" do

    it "routes to #index" do
      get("/question_answers").should route_to("question_answers#index")
    end

    it "routes to #new" do
      get("/question_answers/new").should route_to("question_answers#new")
    end

    it "routes to #show" do
      get("/question_answers/1").should route_to("question_answers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_answers/1/edit").should route_to("question_answers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_answers").should route_to("question_answers#create")
    end

    it "routes to #update" do
      put("/question_answers/1").should route_to("question_answers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_answers/1").should route_to("question_answers#destroy", :id => "1")
    end

  end
end
