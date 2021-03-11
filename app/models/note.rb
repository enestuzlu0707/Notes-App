class Note < ApplicationRecord
  after_initialize :init

  enum priority: {
    low: 'low',
    medium: 'medium',
    high: 'high',
  }
    
  belongs_to :user  

  paginates_per 10
  max_paginates_per 100

  validates :title, presence: true
  validates :content, presence: true
  validates :date_taken, presence: true
  validates :user_id, presence: true
  validates :priority, presence: true
  validates :priority, inclusion: { in: priorities.keys }

  def init
    self.date_taken ||= Time.now
  end


  def self.notes_for_user(user)
    Note.where(user: user)
  end

  def user_email
    self.user.email
  end
end
