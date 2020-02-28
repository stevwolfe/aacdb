class AddOccupationsToTemporaryLists < ActiveRecord::Migration[5.1]
  def change
    add_column :temporary_lists, :occupation, :string
  end
end
