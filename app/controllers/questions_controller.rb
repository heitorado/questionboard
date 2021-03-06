class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :answer]
  before_action :authenticate_user!, except: [:new, :create]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def pending
    @questions = Question.where(answered_at: nil).order(created_at: :desc)
  end

  def answered
    @questions = Question.where.not(answered_at: nil).order(created_at: :desc)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        send_telegram_post_req(@question)

        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
        format.js
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
        format.js { render :status => 400 }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
      format.js { }
    end
  end

  def answer
    @question.answered_at = Time.now
    @question.user = current_user
    
    respond_to do |format|
      if @question.save
        format.js { }
      else
        format.js { render :status => 400 }
      end
    end
  end

  private
    # Send the message to the telegram bot so it notifies its subscribers real-time
    def send_telegram_post_req(question)
      require 'net/http'
      require 'json'

      begin
          uri = URI('https://iptemplebot.herokuapp.com/notify')
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          req = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
          req.body = { "msg" => question.text }.to_json
          res = http.request(req)
          # puts "response #{res.body}"
          # puts JSON.parse(req.body)
      rescue => e
          puts "failed #{e}"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :answered_at)
    end
end
