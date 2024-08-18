# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Factories" do
  it "all factories are valid" do
    expect {
      FactoryBot.lint verbose: true
    }.to_not raise_error
  end
end
