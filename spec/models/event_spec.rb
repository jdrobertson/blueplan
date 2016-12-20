require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:all_day_event) { Event.new(name: "AllDayEvent", date: Date.today, time: nil, description: nil)}

  describe "#all_day?" do
    it "returns true when time is nil" do
      expect(all_day_event).to be_all_day
    end
  end
end
