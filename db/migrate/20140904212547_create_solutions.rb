class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|

    	t.text :description, null: false
    	t.boolean :worked?, null: false

      t.timestamps
    end
  end
end
