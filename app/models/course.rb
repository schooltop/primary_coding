class Course < ApplicationRecord
	belongs_to :course
	has_many :employee_courses

	def save_comment
        barcode_only_path = "#{Rails.root}/tmp/comments/course_#{self.id}.rb"
	    return barcode_only_path if File.exists?(barcode_only_path)
	    File.open(barcode_only_path, 'wb'){|f| f.write self.comment }
	    barcode_only_path
	end

	def ruby_run_comment
		barcode_only_path = "#{Rails.root}/tmp/comments/course_#{self.id}.rb"
        j = %x(ruby #{barcode_only_path})
	    p j
	    j
	end

	def python_run_comment
        barcode_only_path = "#{Rails.root}/tmp/comments/course_#{self.id}.rb"
        b = %x(python #{barcode_only_path})
	    p b
	    b
	end	

end
