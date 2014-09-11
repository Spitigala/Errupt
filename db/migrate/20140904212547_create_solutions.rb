class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|

    	t.text :description
    	t.boolean :worked?

      t.timestamps
    end
  end
end
