class CreateTemporaryLists < ActiveRecord::Migration[5.1]
  def change
    create_table :temporary_lists do |t|

      t.timestamps
    end
  end
end
