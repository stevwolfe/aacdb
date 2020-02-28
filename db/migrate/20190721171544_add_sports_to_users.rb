class AddSportsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :aerobics, :string
    add_column :users, :golf, :string
    add_column :users, :martial_arts, :string
    add_column :users, :soccer, :string
    add_column :users, :walking, :string
    add_column :users, :rugby, :string
    add_column :users, :swimming, :string
    add_column :users, :baseball, :string
    add_column :users, :cycling, :string
    add_column :users, :running, :string
    add_column :users, :tennis, :string
    add_column :users, :weight, :string
    add_column :users, :basketball, :string
    add_column :users, :skiing, :string
    add_column :users, :volleyball, :string
  end
end
