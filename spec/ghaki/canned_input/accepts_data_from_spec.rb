require 'ghaki/canned_input/accepts_data_from'

describe Ghaki::CannedInput::AcceptsDataFrom do
  include Ghaki::CannedInput::AcceptsDataFrom

  subject { self }
  it { should respond_to :it_should_accept_data_from }
  it { should respond_to :it_should_reject_data_from }

end
