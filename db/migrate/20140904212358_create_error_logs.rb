class CreateErrorLogs < ActiveRecord::Migration
  def change
    create_table :error_logs do |t|

    	t.string :title, null: false
    	t.text :description, null: false
    	t.string :os
    	t.string :os_version
    	t.string :language
    	t.string :language_version
    	t.string :framework
    	t.string :framework_version

      t.timestamps
    end
  end
end
