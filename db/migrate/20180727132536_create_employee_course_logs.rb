class CreateEmployeeCourseLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_course_logs do |t|
      t.references :employee	
      t.references :employee_course
      t.references :employee_course_detail
      t.references :course_type
      t.text "comment", comment: "编程内容"
      t.text "message", comment: "执行结果" 
      t.timestamps 	
    end
  end
end
