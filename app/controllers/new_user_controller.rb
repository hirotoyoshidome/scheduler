
require 'digest/sha2'
class NewUserController < ApplicationController

  # 新規ユーザー追加画面初期表示
  def index
    @title = '新規ユーザー作成'
    @top = Top.new
  end

  # 新規ユーザー作成
  def create
    @title = 'ユーザー作成完了'
    password = Digest::SHA256.hexdigest(params[:top][:password])

    if Top.find_by(auth_name: params[:top][:auth_name]) == nil then
      # 使用されていなかったらインサートする
      new_user = Top.new(top_params)
      # コミットできないと元の画面に戻す
      redirect_to new_user_index_path unless new_user.save
    else
      # 使用されていたら入力画面に戻す
      redirect_to new_user_index_path
    end
  end

  # 入力値をセットする。
  def top_params
    param = {"auth_name" => params[:top]['auth_name'], "password" => Digest::SHA256.hexdigest(params[:top]['password'])}
    return param
  end
end
