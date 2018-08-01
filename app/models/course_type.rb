class CourseType < ApplicationRecord
  has_many :courses
  has_many :employee_course_details
  has_many :employee_course_logs
end
