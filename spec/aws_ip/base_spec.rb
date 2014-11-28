require 'spec_helper'

RSpec.describe AwsIp::Base do
  before do
    stub_base_request
    @ip = AwsIp.new
  end

  describe '#fetch' do
    before do
      @result = [{"ip_prefix"=>"54.240.200.0/24", "region"=>"ap-northeast-1", "service"=>"AMAZON"}]
    end
    context 'in range' do
      it { expect(@ip.fetch('54.240.200.0')).to eq(@result) }
      it { expect(@ip.fetch('54.240.200.255')).to eq(@result) }
    end
    context 'out of range' do
      it { expect(@ip.fetch('54.240.201.0')).to eq([]) }
    end
  end

  describe '#include?' do
    context 'in range' do
      it { expect(@ip.include?('54.240.200.0')).to be_truthy }
      it { expect(@ip.include?('54.240.200.255')).to be_truthy }
    end
    context 'out of range' do
      it { expect(@ip.include?('54.240.201.0')).to be_falsey }
    end
  end

end
