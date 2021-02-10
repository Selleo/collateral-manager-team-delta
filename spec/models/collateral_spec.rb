require 'rails_helper'

RSpec.describe Collateral, type: :model do
  before(:each) do
    @attr = {:name => "Hello world!", url: "www.example.com"}
  end

  it "should create a new instance given valid attributes" do
    collateral = Collateral.create!(@attr)
    assert_equal collateral.name, "Hello world!"
  end
end
