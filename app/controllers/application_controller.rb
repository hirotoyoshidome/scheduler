class ApplicationController < ActionController::Base

  # ユーザーエージェントを判定する
  # スマホならsp それ以外はpcを返却する
  def judge_user_agent
    if request.user_agent.include?('Mobile') then
      @sp = true
      return 'sp'
    else
      return nil
    end
  end
end
