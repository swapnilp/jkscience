class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :subject, :null => false
      t.integer :chapter_number, :null => false
      t.string :name, :null => false
      t.timestamps
    end
  end
end
