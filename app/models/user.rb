class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :user_answers
  has_many :teacher_divisions
  has_many :divisions, through: :teacher_divisions
  belongs_to :division, optional: true


  validates :role, inclusion: { in: %w[teacher student admin] }
end
