class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    # 日付順で表示(.allと同じ分取り出す)
    @schedules = Schedule.order(:plan_date)
    @users = User.all
    @title = 'スケジュール一覧'
    if judge_user_agent == 'sp' then
      render 'index_sp'
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @title = 'スケジュール確認'
    judge_user_agent
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    @title = 'スケジュール新規登録'
    @user_id = params[:user_id]
    judge_user_agent
  end

  # GET /schedules/1/edit
  def edit
    @title = 'スケジュール編集'
    @user_id = Schedule.find(params[:id]).user_id
    judge_user_agent
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'スケジュールの登録が正常に行われました。' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'スケジュールの更新が正常に行われました。' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'スケジュールの削除が正常に行われました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:title, :plan_date, :level, :user_id)
    end
end
