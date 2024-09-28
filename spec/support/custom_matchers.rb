# frozen_string_literal: true

RSpec::Matchers.define :have_turbo_stream do |action:, target: nil, targets: nil|
  match do |_actual|
    assert_turbo_stream(action:, target:, targets:, &block_arg).present?
  end
end
