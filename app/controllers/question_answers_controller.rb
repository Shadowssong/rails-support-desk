class QuestionAnswersController < ApplicationController
  # GET /question_answers
  # GET /question_answers.json
  after_filter :update_views, :except => :search
  def search
    query = params[:q]
    @question_answers = QuestionAnswer.where{(question=~ "%#{query}%")|(answer=~ "%#{query}%")}
  end

  def index
    @question_answers = QuestionAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_answers }
    end
  end

  # GET /question_answers/1
  # GET /question_answers/1.json
  def show
    @question_answer = QuestionAnswer.find(params[:id])
    @category = Category.find(params[:category_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_answer }
    end
  end

  # GET /question_answers/new
  # GET /question_answers/new.json
  def new
    @question_answer = QuestionAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_answer }
    end
  end

  # GET /question_answers/1/edit
  def edit
    @question_answer = QuestionAnswer.find(params[:id])
  end

  def create
    @question_answer = QuestionAnswer.new(params[:question_answer])

    if @question_answer.save
      flash[:notice] = 'Question answer was successfully created.' 
      redirect_to category_question_answer_path(@question_answer.category, @question_answer) 
    else
      render action: "new"
    end
  end

  # PUT /question_answers/1
  # PUT /question_answers/1.json
  def update
    @question_answer = QuestionAnswer.find(params[:id])

    respond_to do |format|
      if @question_answer.update_attributes(params[:question_answer])
        format.html { redirect_to category_question_answer_path(@question_answer.category, @question_answer), notice: 'Question answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_answers/1
  # DELETE /question_answers/1.json
  def destroy
    @question_answer = QuestionAnswer.find(params[:id])
    category = @question_answer.category
    @question_answer.destroy

    respond_to do |format|
      format.html { redirect_to category }
      format.json { head :no_content }
    end
  end


  # you put filter methods in the bottom of a controller in a private area
  private
  def update_views
    QuestionAnswer.increment_counter("views", @question_answer.id)
  end
end
