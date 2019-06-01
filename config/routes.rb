Rails.application.routes.draw do
  # 新規ユーザー作成初期表示
  get 'new_user/index'
  # 新規ユーザー作成
  post 'new_user/create'
  # logout用のコントローラ
  get 'logout/logout'
  # 認証用のコントローラ
  get 'top/index'
  post 'top/auth'
  # RESTful設計でルートを設定する
  resources :schedules
  resources :users
  # トップページを設定する
  root 'top#index'
end
