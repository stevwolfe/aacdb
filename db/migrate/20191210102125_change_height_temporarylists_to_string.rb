class ChangeHeightTemporarylistsToString < ActiveRecord::Migration[5.1]
  def change
  	change_column :temporary_lists, :height, :string
  end
end
