# == Schema Information
#
# Table name: dogs
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime
#
class Dog < ApplicationRecord
  validates :name, presence: true # validates that it exists now on the model also
  validate  (:check_name_length)

  def check_name_length
    unless self.name.length >= 4
      errors[:name] << "is too short, must be longer than 4 or more characters."
    end
  end

  has_many(:toys, {
    primary_key: :id, #dog's id
    foreign_key: :dog_id,
    class_name: :Toy
  })

  def self.lookup_time_in_ms(name)
    start = Time.now
    Dog.where(name: name)
    (Time.now - start) * 1000
  end

end
