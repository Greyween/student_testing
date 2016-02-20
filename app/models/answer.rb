class Answer < ActiveRecord::Base
  belongs_to :question

  validates :content, presence: true, length: { maximum: 250 }
end
