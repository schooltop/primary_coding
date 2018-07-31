class CreateEmployeeCourseDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_course_details do |t|
      t.references :employee	
      t.references :employee_course
      t.references :course_type
      t.integer :status,default:0, comment: "0练习，1作业" 
      t.text "comment", comment: "编程内容" 
      t.string  "page_url", comment: "文件url" 
      t.timestamps 
    end
  end
end
