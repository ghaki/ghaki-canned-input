require 'ghaki/canned_input/raises_on_data'

describe Ghaki::CannedInput::RaisesOnData do
  include Ghaki::CannedInput::RaisesOnData

  subject { self }
  it { should respond_to :it_should_raise_on_data }

end
