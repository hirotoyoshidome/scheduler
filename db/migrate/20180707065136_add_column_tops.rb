class AddColumnTops < ActiveRecord::Migration[5.2]
  def change
    add_column :tops, :auth_name, :string
    add_column :tops, :password, :string
  end
end
