class  EmployeeCourseLog < ApplicationRecord
	belongs_to :employee
    belongs_to :employee_course
    belongs_to :course_type
    belongs_to :employee_course_detail
end
