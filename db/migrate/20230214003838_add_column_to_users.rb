class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :age, :integer
    add_column :users, :gender, :integer
    add_column :users, :password, :string, null: false
    add_column :users, :token, :string
    add_column :users, :phone_number, :string
    add_column :users, :birth_date, :date
    add_column :users, :height, :float
    add_column :users, :weight, :float

  end
end
