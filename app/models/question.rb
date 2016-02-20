class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers

  validates :content, presence: true, length: { maximum: 250 }
end
