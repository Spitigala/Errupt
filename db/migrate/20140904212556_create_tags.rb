class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|

    	# t.belongs_to :errorlog
    	# t.belongs_to :ErrorTag
    	t.string :tag_name

      t.timestamps
    end
  end
end
