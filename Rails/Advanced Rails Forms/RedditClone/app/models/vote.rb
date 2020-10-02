# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  post_id    :integer
#  comment_id :integer
#  value      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vote < ApplicationRecord
  def upvote
    self.value += 1
    self.save
  end

  def downvote
    self.value -= 1
    self.save
  end
end
