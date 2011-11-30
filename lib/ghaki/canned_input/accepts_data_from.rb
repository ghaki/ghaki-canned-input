module Ghaki       #:nodoc:
module CannedInput #:nodoc:

module AcceptsDataFrom

  def it_should_accept_data_from data, name, &block
    _should_accept_with 'should accept', true, data, name, &block
  end

  def it_should_reject_data_from data, name, &block
    _should_accept_with 'should reject', false, data, name, &block
  end

  protected

  def _should_accept_with_hash prefix, state, data, &block
    data.each_pair do |item,rule|
      it prefix + ': ' + rule.to_s do
        block.call(item).should == state
      end
    end
  end

  def _should_accept_with_array prefix, state, data, &block
    data.each do |item|
      it prefix + ': ' + item.to_s do
        block.call(item).should == state
      end
    end
  end

  def _should_accept_with prefix, state, cfg_data, cfg_name, &block
    name = cfg_name.to_s
    data = cfg_data[name]
    case data
    when nil then
      raise ArgumentError, 'Missing Acceptance Test Data For: ' + name
    when Array then
      _should_accept_with_array prefix, state, data, &block
    when Hash then
      _should_accept_with_hash  prefix, state, data, &block
    else
      raise ArgumentError, 'Invalid Acceptance Test Data For: ' + name
    end
  end

end
end end
