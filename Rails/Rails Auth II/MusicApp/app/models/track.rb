# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  is_bonus   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  albumn_id  :integer          not null
#
class Track < ApplicationRecord
  validates :title, presence: true
  validates :ord, presence: true

  belongs_to(:albumn, {
    primary_key: :id,
    foreign_key: :albumn_id,
    class_name: :Albumn
  })
end
