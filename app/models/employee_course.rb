class EmployeeCourse < ApplicationRecord
   belongs_to :employee
   belongs_to :course
end
