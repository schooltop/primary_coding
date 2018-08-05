class  EmployeeCourseDetail < ApplicationRecord
	belongs_to :employee
    belongs_to :employee_course
    belongs_to :course_type

	def save_comment
        barcode_only_path = "#{Rails.root}/tmp/details/detail_#{self.id}.#{self.course_type&.suffix_name}"
	    #return barcode_only_path if File.exists?(barcode_only_path)
	    file = File.open(barcode_only_path, 'wb'){|f| f.write self.comment }
	    file.close
	    barcode_only_path
	end

	def ruby_run_comment
		save_comment
        j = %x(ruby #{barcode_only_path})
	    p j
	    j
	end

	def python_run_comment
		save_comment
        b = %x(python #{barcode_only_path})
	    p b
	    b
	end	

end
