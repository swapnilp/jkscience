class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :phone_number, :null => false
      t.string :group, :null => false
      t.integer :standerd, :null => false
      t.float :ssc_marks, :null => false
      t.string :email, :null => false
      t.string :parent_contact , :null => false
      t.timestamps
    end
  end
end
