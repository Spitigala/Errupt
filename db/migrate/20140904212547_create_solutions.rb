class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|

    	t.belongs_to :errorlog
    	t.text :description, null: false
    	t.boolean :worked?, null: false

      t.timestamps
    end
  end
end
