module Ghaki       #:nodoc:
module CannedInput #:nodoc:

module TransformsDataInto

  def it_should_transform_data_into cfg_data, cfg_name, &block
    name = cfg_name.to_s
    data = cfg_data[name]
    case data
    when nil then
      raise ArgumentError, 'Missing Acceptance Test Data For: ' + name
    when Array then
      _should_transform_data_from_table data, &block
    when Hash then
      _should_transform_data_from_hash  data, &block
    else
      raise ArgumentError, 'Invalid Acceptance Test Data For: ' + name
    end
  end

  protected

  def _should_transform_data_make rule, get, put, &block
    it 'should transform: ' + rule do
      block.call( get ).should == put
    end
  end

  def _should_transform_data_from_hash data, &block
    data.each_pair do |input,output|
      _should_transform_data_make input.to_s, input, output, &block
    end
  end

  def _should_transform_data_from_table data, &block
    data.each do |entry|
      rule = entry['rule'] || entry['input'].to_s
      _should_transform_data_make rule, entry['input'], entry['output'], &block
    end
  end

end
end end
