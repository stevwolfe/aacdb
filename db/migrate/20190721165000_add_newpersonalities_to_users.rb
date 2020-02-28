class AddNewpersonalitiesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :independent, :string
    add_column :users, :mature, :string
    add_column :users, :outgoing, :string
    add_column :users, :self_confident, :string
    add_column :users, :cultivated, :string
    add_column :users, :reliable, :string
    add_column :users, :spiritual, :string
    add_column :users, :imaginative, :string
    add_column :users, :sophisticated, :string
  end
end
