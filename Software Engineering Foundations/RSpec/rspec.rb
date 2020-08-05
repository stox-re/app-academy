# RSpec automated testing
# Anatomy of an rspec project

# /example_project
#   ├── lib
#   │   ├── add.rb
#   │   └── prime.rb
#   └── spec
#       ├── add_spec.rb
#       └── prime_spec.rb

# Core rspec terms that can be found in rspec file
# "describe" names the method being tested
# "it" expresses the expected behavior of the method being tested
# "expect" shows how that behavior is tested

# Install ruby bundle gems
# bundle install
# This will install required gems in the Gemfile

# Executing rpsec
# bundle exec rspec
# This executes rspec from in the main directory of the program


#--------------------------------------------
# Example of a prime_spec rspec file
# /spec/prime_spec.rb
require "prime"

describe "prime? method" do
  it "should accept a number as an argument" do
    expect { prime?(7) }.to_not raise_error
  end

  context "when the number is prime" do
    it "should return true" do
      expect(prime?(7)).to eq(true)
      expect(prime?(11)).to eq(true)
      expect(prime?(13)).to eq(true)
    end
  end

  context "when the number is not prime" do
    it "should return false" do
      expect(prime?(4)).to eq(false)
      expect(prime?(9)).to eq(false)
      expect(prime?(20)).to eq(false)
      expect(prime?(1)).to eq(false)
    end
  end
end