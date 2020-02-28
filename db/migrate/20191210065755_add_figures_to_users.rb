class AddFiguresToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :figure, :string
  end
end
