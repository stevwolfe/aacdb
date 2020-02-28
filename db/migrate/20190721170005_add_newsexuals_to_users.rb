class AddNewsexualsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :being_blinded, :string
    add_column :users, :willing_experiment, :string
    add_column :users, :costume, :string
    add_column :users, :role_playing, :string
    add_column :users, :using_sex_toys, :string
    add_column :users, :unusual_places, :string
    add_column :users, :being_watched, :string
  end
end
