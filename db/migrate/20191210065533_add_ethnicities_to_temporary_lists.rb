class AddEthnicitiesToTemporaryLists < ActiveRecord::Migration[5.1]
  def change
    add_column :temporary_lists, :ethnicity, :string
  end
end
