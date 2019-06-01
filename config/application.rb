require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

# アプリケーションコンテキスト(全体の設定)
module Scheduler
  class Application < Rails::Application
    config.load_defaults 5.2
    # エラーメッセージを日本語化
    config.i18n.default_locale = :ja
    # locales配下の.rb, .ymlファイルを読み込む
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
