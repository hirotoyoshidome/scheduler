## Heroku 初期設定

* Herokuにデプロイした際にdelete methodが使用できなくなってしまった。
これはlink_toメソッドがgetにしか対応できていないため発生。
/app/assets/javascripts/application.jsに
```//= require jquery_ujs```
を追加したが反応せず、button_toメソッドに変更することで正常動作を確認。

