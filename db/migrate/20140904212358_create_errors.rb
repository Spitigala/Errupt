class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|

    	t.string :title
    	t.text :description
    	t.string :OS

      t.timestamps
    end
  end
end
