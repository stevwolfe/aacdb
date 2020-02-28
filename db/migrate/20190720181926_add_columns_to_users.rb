class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :description, :text
    add_column :users, :age, :integer
    add_column :users, :marital_status, :string
    add_column :users, :anything_exciting, :string
    add_column :users, :long_term, :string
    add_column :users, :open_anything, :string
    add_column :users, :short_term, :string
    add_column :users, :undecided, :string
    add_column :users, :virtual, :string
    add_column :users, :height, :integer
    add_column :users, :hair_color, :string
    add_column :users, :eye_color, :string
    add_column :users, :smoker, :string
    add_column :users, :anything_goes, :string
    add_column :users, :dominated, :string
    add_column :users, :dominate, :string
    add_column :users, :normal, :string
    add_column :users, :threesome, :string
    add_column :users, :secret, :string
    add_column :users, :active, :string
    add_column :users, :shy, :string
    add_column :users, :sociable, :string
    add_column :users, :fun, :string
    add_column :users, :generous, :string
    add_column :users, :relaxed, :string
    add_column :users, :moody, :string
    add_column :users, :modest, :string
    add_column :users, :sensitive, :string
    add_column :users, :photos, :text, array: true, default: []
  end
end
