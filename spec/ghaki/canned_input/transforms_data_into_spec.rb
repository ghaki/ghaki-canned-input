require 'ghaki/canned_input/transforms_data_into'

describe Ghaki::CannedInput::TransformsDataInto do
  include Ghaki::CannedInput::TransformsDataInto

  subject { self }
  it { should respond_to :it_should_transform_data_into }

end
