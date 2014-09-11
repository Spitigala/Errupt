class CreateErrorLogs < ActiveRecord::Migration
  def change
    create_table :errors_logs do |t|

    	t.string :title
    	t.text :description
    	t.string :OS

      t.timestamps
    end
  end
end
