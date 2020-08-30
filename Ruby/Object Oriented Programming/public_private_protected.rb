# Public, private, and protected methods
class Cat
  public
  def meow
    puts "meow"
  end

  # access control gets set until another access control statement is
  # seen.
  def other_public_method
  end

  private
  def thoughts
    ...
  end

  protected
  def clean
    ...
  end
end