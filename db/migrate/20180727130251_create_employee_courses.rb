class CreateEmployeeCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_courses do |t|
      t.references :employee	
      t.references :course	
      t.integer :status,default:0, comment: "0默认，1关闭" 
      t.timestamps 
    end
  end
end
