class LogoutController < ApplicationController

  # sessionをすべて破棄
  def logout
    @title = 'ログアウト'
    reset_session
  end
end
