class CreateTestquestions < ActiveRecord::Migration
  def change
    create_table :testquestions do |t|
      t.references :user, :null => false
      t.references :jktest, :null => false
      t.references :question, :null => false
      t.timestamps
    end
  end
end
