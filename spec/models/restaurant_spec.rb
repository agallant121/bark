require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it {should belong_to :user}
    it {should have_many :reviews}
  end
end
