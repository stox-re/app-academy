class Goal < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def set_public
    self.is_public = true
    self.save!
  end

  def set_private
    self.is_public = false
    self.save!
  end
end

