
require 'digest/sha2'
class TopController < ApplicationController
  # 認証の初期表示
  def index
    @title = 'TOP'
    @top = Top.new
    judge_user_agent
    # 初期表示でログイン用のmodelをセッション管理する
    session[:top] = params[:top]
  end

# 判定アクション
  def auth
    if auth_valid? then
      # ログイン成功時にセッションを一度破棄する。
      session[:top] = nil

      # TODO session再生成(下記は仮)
      session[:top] = params[:top]
      # ここまで仮

      redirect_to users_path
    else
      redirect_to root_path
    end
    judge_user_agent
  end

# 入力値判定メソッド
  private
  def auth_valid?
    # DB格納データもハッシュで暗号化されている
    password = Digest::SHA256.hexdigest(params[:top][:password])
    # auth_nameをもとに取り出す
    db_password = Top.find_by(auth_name: params[:top][:auth_name])[:password]
    if password == db_password then
      true
    else
      false
    end
 end
end
