class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :ratings, dependent: :destroy
  has_many :users

  def name
    "#{firstName} #{middleName} #{lastName}"
  end

  def to_s
    name
  end
end
