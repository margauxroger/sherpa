class TeacherDivision < ApplicationRecord
  belongs_to :user
  belongs_to :division
  has_many :suggestions
end
