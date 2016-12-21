require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:normal_event) { Event.create(name: "NormalEvent", starts_at: DateTime.new(2001, 02, 03, 04, 05, 06), ends_at: DateTime.new(2001, 02, 03, 07, 05, 06)) }
  let(:nameless_event) { Event.create(starts_at: DateTime.new, ends_at: DateTime.new) }
  let(:startless_event) { Event.create(name: "StartlessEvent", ends_at: DateTime.new) }
  let(:endless_event) { Event.create(name: "EndlessEvent", starts_at: DateTime.new) }
  let(:end_before_start_event) { Event.create(name: "EndBeforeStart", starts_at: DateTime.new(2001, 02, 03, 04, 05, 06), ends_at: DateTime.new(2001, 01, 03, 07, 05, 06)) }

  describe "validations" do
    it "it valid with valid attributes" do
      expect(normal_event).to be_valid
    end

    it "is not valid without a name" do
      expect(nameless_event).to be_invalid
    end

    it "is not valid without a starts_at" do
      expect(startless_event).to be_invalid
    end

    it "is not valid without an ends_at" do
      expect(endless_event).to be_invalid
    end

    it "is not valid if end datetime is earlier than start datetime" do
      expect(end_before_start_event).to be_invalid
    end
  end

  let(:multi_day_event) { Event.create(name: "MultiDayEvent", starts_at: DateTime.new.beginning_of_day, ends_at: DateTime.new.end_of_day) }

  describe "#all_day?" do
    it "returns true when event starts at beginning of a day and ends at the end of a day" do
      expect(multi_day_event).to be_all_day
    end

    it "returns false when event does not start at the beginning of a day and end at end of a day" do
      expect(normal_event).to_not be_all_day
    end
  end
end
