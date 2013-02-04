class UserTestsController < ApplicationController
  # GET /user_tests
  # GET /user_tests.json
  before_filter :authenticate_user!

  def index

    @users=User.order(:score)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_tests }
    end
  end

  # GET /user_tests/1
  # GET /user_tests/1.json
  def show
    @user_test = UserTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_test }
    end
  end

  # GET /user_tests/new
  # GET /user_tests/new.json
  def new
    @user_test = UserTest.new
    if current_user.test_started_at==nil
      current_user.test_started_at=Time.now
      current_user.save!
    end
    @questions=Question.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_test }
    end
  end

  # GET /user_tests/1/edit
  def edit
    @user_test = UserTest.find(params[:id])
  end

  # POST /user_tests
  # POST /user_tests.json
  def create


    flag=0
    @questions=Question.all
    @questions.each do |question|
      @user_test = UserTest.new
      @user_test.user_id=current_user.id
      @user_test.question_id=question.id
      @user_test.answer_id=params[question.id.to_s]
      @user_test.save!
      flag=1

    end
    #here we store the fact that this user has already taken the test
    if flag==1
      current_user.test_taken=true
      current_user.save!
      flag=1
    end


    respond_to do |format|
      if flag==1
        format.html { redirect_to root_path, notice: 'You have given the test . Thank you..' }
        format.json { render json: @user_test, status: :created, location: @user_test }
      else
        format.html { render action: "new" }
        format.json { render json: @user_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_tests/1
  # PUT /user_tests/1.json
  def update
    @user_test = UserTest.find(params[:id])

    respond_to do |format|
      if @user_test.update_attributes(params[:user_test])
        format.html { redirect_to @user_test, notice: 'User test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tests/1
  # DELETE /user_tests/1.json
  def destroy
    @user_test = UserTest.find(params[:id])
    @user_test.destroy

    respond_to do |format|
      format.html { redirect_to user_tests_url }
      format.json { head :no_content }
    end
  end
  def calculate_time_left

  end
end
