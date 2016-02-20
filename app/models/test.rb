class Test < ActiveRecord::Base
  has_many :questions

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
end
