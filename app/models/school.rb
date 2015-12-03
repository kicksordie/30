class School < ActiveRecord::Base
  has_many :teachers, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 5 }
end
