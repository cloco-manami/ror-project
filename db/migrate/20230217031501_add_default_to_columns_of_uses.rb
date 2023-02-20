class AddDefaultToColumnsOfUses < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :first_name, from: false, to: true
    change_column_default :users, :last_name, from: false, to: true
    change_column_default :users, :first_name_kana, from: false, to: true
    change_column_default :users, :last_name_kana, from: false, to: true
    change_column_default :users, :password, from: false, to: true
  end
end
