require "rails_helper"

RSpec.describe Task do
  it { is_expected.to validate_presence_of :subject }
  it { is_expected.to validate_presence_of :content }
end
