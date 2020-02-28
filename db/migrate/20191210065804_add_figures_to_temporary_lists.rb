class AddFiguresToTemporaryLists < ActiveRecord::Migration[5.1]
  def change
    add_column :temporary_lists, :figure, :string
  end
end
