require "rails_helper"

RSpec.describe Attempt, :type => :model do
	let(:season) {Season.create(description: "asdf", number: 1)}
	let(:attempt) {Attempt.create(name: "Adam", season: season)}

	it "create attempt correctly" do
		attempt
		expect(Attempt.last).to eq(attempt)
	end
end