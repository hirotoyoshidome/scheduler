class Schedule < ApplicationRecord
  # 文字数制限(45文字まで)
  validates :title, length: {maximum: 45}
  # 1対多の関係を指定する(単数形)
  belongs_to :user
end
