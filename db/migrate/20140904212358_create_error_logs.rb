class CreateErrorLogs < ActiveRecord::Migration
  def change
    create_table :errorlogs do |t|

      t.belongs_to :user
    	t.string :title, null: false
    	t.text :description, null: false
    	t.string :os
    	t.string :os_version
    	t.string :language
    	t.string :language_version
    	t.string :framework
      t.string :framework_version
    	t.boolean :public?, null: false

      t.timestamps
    end
  end
end
