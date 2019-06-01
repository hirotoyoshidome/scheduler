class User < ApplicationRecord
  # 文字数制限(1-15文字以内に設定する)
  validates :name , length: {minimum: 1, maximum: 15}
  validates :email, length: {minimum: 1, maximum: 45}
  # 1対多の関係を指定する(複数形で定義)
  has_many :schedules
end
