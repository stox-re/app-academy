# A user's posts should be destroyed if the user is destroyed;
# else the posts are said to be widowed. To do this, we pass the :dependent option to has_many:

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end

class Post < ApplicationRecord
  belongs_to :user
end

>> user = User.first
=> #<User id: 1>
>> user.posts.create!
=> #<Post id: 1, user_id: 1>
>> user.destroy
=> #<User id: 1>

class User < ApplicationRecord
  validates :random_code, presence: true
  before_validation :ensure_random_code

  protected
  def ensure_random_code
    # assign a random code
    self.random_code ||= SecureRandom.hex(8)
  end
end

# before_validation (handy as a last chance to set forgotten fields!)
# after_create (handy to do some post-create logic, like send a confirmation email)
# after_destroy (handy to perform post-destroy clean-up logic)

class CreditCard < ApplicationRecord
  # Strip everything but digits, so the user can specify "555 234 34" or
  # "5552-3434" or both will mean "55523434"
  before_validation(on: :create) do
    self.number = number.gsub(/[^0-9]/, '') if attribute_present?('number')
  end
end

#--------------Delegation--------------
class Office < ApplicationRecord
  belongs_to :doctor
end

class Doctor < ApplicationRecord
  has_one :office
  has_many :patients
  delegate :number,
    :address,
    to: :office,
    prefix: true
end

class Patient < ApplicationRecord
  belongs_to :doctor
  delegate :name,
    :specialty,
    :office_number,
    :office_address,
    to: :doctor,
    prefix: true
end

<%= @patient.doctor_name %>
<%= @patient.doctor_specialty %>
<%= @patient.doctor_office_number %>
<%= @patient.doctor_office_address %>

#Instead of:
<%= @patient.doctor.name %>
<%= @patient.doctor.specialty %>
<%= @patient.doctor.office.number %>
<%= @patient.doctor.office.address %>