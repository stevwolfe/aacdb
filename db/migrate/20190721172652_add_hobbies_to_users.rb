class AddHobbiesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :arts, :string
    add_column :users, :cooking, :string
    add_column :users, :hiking, :string
    add_column :users, :networking, :string
    add_column :users, :video_games, :string
    add_column :users, :book, :string
    add_column :users, :dining_out, :string
    add_column :users, :movies, :string
    add_column :users, :nightclubs, :string
    add_column :users, :religion, :string
    add_column :users, :charity, :string
    add_column :users, :museum, :string
    add_column :users, :shopping, :string
    add_column :users, :wine, :string
    add_column :users, :coffee, :string
    add_column :users, :gardening, :string
    add_column :users, :pets, :string
  end
end
