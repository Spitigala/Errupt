class CreateErrorLogs < ActiveRecord::Migration
  def change
    create_table :errors_logs do |t|

    	t.string :title
    	t.text :description
    	t.string :OS
    	t.string :os_version
    	t.string :language
    	t.string :language_version
    	t.string :framework
    	t.string :framework_version

      t.timestamps
    end
  end
end
