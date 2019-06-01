## 注意点
* またもやsqlite3のエラーで
```rails server```コマンドが起動しなかったため
```C:\Ruby25-x64\lib\ruby\gems\2.5.0\gems\sqlite3-1.3.13-x64-mingw32\lib\sqlite3```直下に
```sqlite3_native.so```ファイル(前回のファイルのコピー)を置いたところサーバーが起動した。

## 操作コマンド
* ユーザーのベースを作成。
```rails generate scaffold user name:string email:string```
コマンドで実行。resourcesに設定。

* ```rails db:migrate```
コマンドでDBを生成。(生成しないとサーバー起動で落ちる)

* ```rails server```コマンドで起動。

* 日本語化を実施するためgemを追加(Gemfile参照)
```bundle install```実行。

* スケジュールのベースを作成。
```rails generate scaffold schedule title:string plan_date:date level:string```
コマンドで実行。resourcesに設定。

* タイトルもレイアウトを使用して設定

* マイグレーションファイルを作成してカラムを追加する場合
```rails generate migration AddColumnSchedules```
で内部に追加するカラムを設定して
```rails db:migrate```
で実行。
* 基本スキーマファイルはいじらないでマイグレーションスクリプトで行った方がいい？？

* 個別でアクションを作成する場合
```rails generate controller top index```
コントローラ名の後にアクション名を指定するとviewも自動生成する。

* モデルを作成する場合は
```rails generate model top```
で作成する。

* TOPページを```root 'top#index'```で設定。

* Topモデルクラスにカラムを追加する。
```rails generate migration AddColumnTops```
でマイグレーションファイルを作成する。

* formを生成する際に
```<%= form_for @top, :url => url_for(:controller => 'users', :action => 'index') do |form| %>```
でurlを指定してformタグを生成する。(@topにTopクラスのインスタンスを格納しておく)

* request.user_agentでユーザーエージェント判定追加。


* 静的コンテンツ(css, img)を追加。

* 画像を配置するときに本番環境ではproduction.rbで静的コンテンツの配置を行う
```config.serve_static_assets = true```
を追加する必要あり。(でないと適用されない。)

* session機能を追加。(application.rbでまとめて管理)

* ログアウト機能も追加。(各画面のログアウトボタンよりセッション情報を全削除)

* ログイン時の認証の情報をDBに移行。(passwordはハッシュ化対応)

* スマホの対応実施。(index画面のみスマホ専用のviewを作成)

* 日付順になるようにorderでソート。

