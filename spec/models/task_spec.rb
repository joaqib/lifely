require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:task)).to be_valid
  end
end

RSpec.describe Task do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:hours_planned) }
    it { is_expected.to validate_presence_of(:goal_id) }
end
