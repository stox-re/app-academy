# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to(:submitter, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  })

  has_many(:visits, {
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit
  })

  has_many(:visitors,
    -> { distinct },
    through: :visits,
    source: :visitor
  )

  def self.random_code
    new_code = SecureRandom::urlsafe_base64
    if ShortenedUrl.exists?({ :short_url => new_code })
      ShortenedUrl.random_code
    end
    new_code
  end

  def self.create_shortened_url(options)
    user = options[:user]
    long_url = options[:long_url]

    ShortenedUrl.create!({
      :long_url => long_url,
      :short_url => ShortenedUrl.random_code,
      :user_id => user.id
    })
  end

  def num_clicks
    Visit.where({ "shortened_url_id" => self.id }).count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    Visit.distinct.where({
      "shortened_url_id" => self.id,
      "created_at" => 1.hour.ago..Time.now
    }).count
  end
end
