class AddEthnicitiesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ethnicity, :string
  end
end
