class  EmployeeCourseDetail < ApplicationRecord
	belongs_to :employee
    belongs_to :employee_course
    belongs_to :course_type

	def save_comment
        barcode_only_path = "#{Rails.root}/tmp/details/detail_#{self.id}.#{self.course_type&.name}"
	    return barcode_only_path if File.exists?(barcode_only_path)
	    File.open(barcode_only_path, 'wb'){|f| f.write self.comment }
	    barcode_only_path
	end

	def ruby_run_comment
		barcode_only_path = "#{Rails.root}/tmp/details/detail_#{self.id}.rb"
        j = %x(ruby #{barcode_only_path})
	    p j
	    j
	end

	def python_run_comment
        barcode_only_path = "#{Rails.root}/tmp/details/detail_#{self.id}.rb"
        b = %x(python #{barcode_only_path})
	    p b
	    b
	end	

end
