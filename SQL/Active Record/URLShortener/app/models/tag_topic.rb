# == Schema Information
#
# Table name: tag_topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TagTopic < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many(:taggings, {
    primary_key: :id,
    foreign_key: :tag_topic_id,
    class_name: :Tagging
  })

  has_many(:urls, {
    through: :taggings,
    source: :shortened_url
  })

  def popular_links
    urls.joins(:visits)
      .group("shortened_urls.short_url", "shortened_urls.id")
      .order('COUNT(visits.user_id) DESC')
      .select('shortened_urls.short_url, shortened_urls.id, COUNT(visits.user_id) as number_of_visits')
      .limit(5)
  end
end
