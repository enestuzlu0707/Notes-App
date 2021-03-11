class Note < ApplicationRecord
  enum priority: {
    low: 'low',
    medium: 'medium',
    high: 'high',
  }
  
  belongs_to :user  

  validates :title, presence: true
  validates :content, presence: true
  validates :date_taken, presence: true
  validates :user_id, presence: true
  validates :priority, presence: true
end
