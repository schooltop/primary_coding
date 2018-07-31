class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
       t.references :course_type	
       t.string   "name"
       t.text "comment"
       t.integer :status,default:0, comment: "0默认，1关闭" 
       t.timestamps 	
    end
  end
end
