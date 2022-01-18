# frozen_string_literal: true

RSpec::Matchers.define :have_same_order do |expected|
  match do |actual|
    # return true or false here
    expected == actual
  end
end
