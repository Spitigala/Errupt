class CreateErrorTags < ActiveRecord::Migration
  def change
    create_table :error_tags do |t|

    	t.belongs_to :errorlog
    	t.belongs_to :tag
    	
      t.timestamps
    end
  end
end
