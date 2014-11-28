require 'spec_helper'

RSpec.describe Range do
  describe 'request behind proxy' do
    before do
      allow(ENV).to receive(:[]).with('no_proxy').and_return('')
      allow(ENV).to receive(:[]).with('https_proxy')
        .and_return('http://proxy_user:proxy_pass@192.168.1.99:9999')
      ip = AwsIp::Range.new
      @proxy = ip.instance_variable_get(:@proxy)
    end
    it { expect(@proxy.host).to eq '192.168.1.99' }
    it { expect(@proxy.user).to eq 'proxy_user' }
    it { expect(@proxy.password).to eq 'proxy_pass' }
    it { expect(@proxy.port).to eq 9999 }
  end

  describe '#get' do
    context 'when getting json error occurred' do
      before do
        stub_request(:get, AwsIp::Range::BASE_URI)
          .to_return(status: 500, headers: { content_type: 'application/json' }, body: '')
      end
      it { expect { AwsIp::Range.new.get }.to raise_error(Exception) }
    end
  end
end
