# == Schema Information
#
# Table name: visits
#
#  id               :bigint           not null, primary key
#  shortened_url_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  visit_count      :integer          default(0), not null
#  user_id          :integer
#
class Visit < ApplicationRecord
  validates :visit_count, presence: true
  validates :shortened_url_id, presence: true
  validates :user_id, presence: true

  belongs_to(:shortened_url, {
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl
  })

  belongs_to(:visitor, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  })

  def self.record_visit!(options)
    user = options["user"]
    shortened_url = options["shortened_url"]

    Visit.create({
      :shortened_url_id => ShortenedUrl.where({"short_url" => shortened_url }).first.id,
      :user_id => user.id
    })
  end

end
