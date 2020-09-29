# --------------- Testing Models ---------------
# What do we test?
  # Validations
  # Associations
  # Class methods
  # Error messages
# Run: bundle exec rspec spec/models/capy_spec.rb

Rspec.describe.Capy, type: :model do

  #subject(:capy) { Capy.new(name: "tim", color: "blue") }
  subject(:capy) { FactoryBot.build(:capy) }

  describe "validations" do
    #it "should validate presence of name" do
    #  capy = Capy.new(color: "blue")
    #  expect(capy.valid?).to be false
    #end
    it { should validate_presence_of(:name) } # Uses gem 'shoulda-matchers' to do the above
    it { should validate_presence_of(:color) } # Uses gem 'shoulda-matchers' to do the above
    it { should validate_uniqueness_of(:name) } # Uses gem 'shoulda-matchers' to do the above
    it "should validate color is not green" do
      #green_capy = Capy.new(name: "deb", color: "green",)
      green_capy = FactoryBot.build(:green_capy)
      green_capy_saved_to_db = FactoryBot.create(:green_capy)
      green_capy.valid?
      expect(green_capy.errors[:color]).to eq(["Cannot be green!"])
    end
  end


  describe "associations" do
    #it "should have many parties"
    #it "should have many attendances"
    #it "should have many parties to attend (is a through association)"
    it { should have_many(:parties) }
    it { shoud have_many(:attendances) }
    it { should have_many(:parties_to_attend).through(:attendances) }
  end

  describe "class methods" do
    describe "::capys_of_the_rainbow" do
      it "should return all capys of color rainbow" do
        #rainbow = Capy.create(name: "rainbow", color: "rainbow")
        #not_rainbow = Capy.create(name: "not a rainbow", color: "sparkles")
        #expect(Capy.capys_of_the_rainbow).to include(rainbow)
        #expect(Capy.capys_of_the_rainbow).not_to include(not_rainbow)

        # .where from activerecord works so we can just do:
        expect(Capy.capys_of_the_rainbow.where_values_hash).to eq("color" => "rainbow")
      end
    end
  end

end

# /spec/factories/capy_models.rb
FactoryBot.define do
  factory :capy do
    name { Faker::Name.name }
    color { Faker::Color.hex_color }

    factory :green_capy do
      color "green"
    end
  end
end