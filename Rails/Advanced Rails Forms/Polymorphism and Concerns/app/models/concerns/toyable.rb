module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    find_check = Toy.find_by({name: name})
    if find_check
      self.toys << find_check
    else
      new_toy = Toy.new({name: name})
      self.toys << new_toy
    end
  end
end