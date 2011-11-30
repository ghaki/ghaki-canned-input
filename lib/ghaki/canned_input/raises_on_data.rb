module Ghaki       #:nodoc:
module CannedInput #:nodoc:

module RaisesOnData

  def it_should_raise_on_data cfg_data, cfg_name, err, msg, &block
    name = cfg_name.to_s
    data = cfg_data[name]
    case data
    when nil then
      raise ArgumentError, 'Missing Acceptance Test Data For: ' + name
    when Array then
      _should_raise_on_data_array data, err, msg, &block
    when Hash then
      _should_raise_on_data_hash  data, err, msg, &block
    else
      raise ArgumentError, 'Invalid Acceptance Test Data For: ' + name
    end
  end

  protected

  def _should_raise_on_data_it rule, data, err, msg, &block
    it 'should raise on: ' + rule do
      lambda do
        block.call( data )
      end.should raise_error( *([err,msg].compact) )
    end
  end

  def _should_raise_on_data_hash data, err, msg, &block
    data.each_pair do |item,rule|
      _should_raise_on_data_it rule, item, err, msg, &block
    end
  end

  def _should_raise_on_data_array data, err, msg, &block
    data.each do |item|
      _should_raise_on_data_it item, item, err, msg, &block
    end
  end

end
end end
