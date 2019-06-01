class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @title = 'ユーザー一覧'
    if judge_user_agent == 'sp' then
      render 'index_sp'
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @title = 'ユーザー確認'
    # 日付でorder
    @schedules = User.find(params[:id]).schedules.order(:plan_date)
  end

  # GET /users/new
  def new
    @user = User.new
    @title = 'ユーザー新規登録'
  end

  # GET /users/1/edit
  def edit
    user_id = params[:id]
    @title = 'ユーザー編集'
    @id = user_id
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'ユーザーの作成が正常に行われました。' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'ユーザー情報の更新が正常に行われました。' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'ユーザーの削除が正常に行われました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
