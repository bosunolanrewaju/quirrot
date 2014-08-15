class TempQuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def initialize
    @count = 0
    #@temp_questions = Array.new
  end

  def increment_count
    @count += 1
  end

  # GET /questions
  # GET /questions.json
  def index
    @temp_questions = Temp_Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @temp_question = Temp_Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    if params[:commit] == "Add More Question" || params[:commit] == "Submit Quiz"
      @temp_question = Temp_Question.new(temp_question_params)
      @question = Question.new(
            entry: temp_question_params["question"],
            option1: temp_question_params["option1"],
            option2: temp_question_params["option2"],
            option3: temp_question_params["option3"],
            answer: temp_question_params["answer"],
            quiz_id: temp_question_params["quiz_id"]
            )
      if @temp_question.save && @question.save
        redirect_to new_temp_question_path(:qid => temp_question_params["quiz_id"]), notice: 'Question was successfully added.'
      else

      end

      if params[:commit] == "Submit Quiz"
        Temp_Question.where(quiz_id: temp_question_params["quiz_id"]).destroy_all
      end
    end
      
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @temp_question.update(temp_question_params)
        format.html { redirect_to @temp_question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @temp_question.destroy
    respond_to do |format|
      format.html { redirect_to temp_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @temp_question = Temp_Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temp_question_params
      params.require(:temp_question).permit(:question, :option1, :option2, :option3, :answer, :quiz_id)
    end
end
