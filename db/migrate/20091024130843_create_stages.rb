class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
#      t.string  :filename, :title, :description, :location,:content_type
#      t.integer :size, :db_file_id,:parent_id
#      t.timestamps

      t.integer :parent_id,  :size, :user_id
      t.string  :content_type, :filename, :ischeck
        
       t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
