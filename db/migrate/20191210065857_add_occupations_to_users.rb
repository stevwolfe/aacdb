class AddOccupationsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :occupation, :string
  end
end
