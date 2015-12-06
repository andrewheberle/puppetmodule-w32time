require 'spec_helper'
describe 'w32time' do

  context 'with defaults for all parameters' do
    it { should contain_class('w32time') }
  end
end
