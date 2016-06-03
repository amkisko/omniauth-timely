require 'spec_helper'

describe OmniAuth::Strategies::Timely do
  describe 'options' do
    subject { OmniAuth::Strategies::Timely.new({}).options }

    it { expect(subject.name).to eq('timely') }
    it { expect(subject.client_options.site).to eq('https://api.timelyapp.com') }
    it { expect(subject.client_options.authorize_url).to eq('/1.0/oauth/authorize') }
    it { expect(subject.client_options.token_url).to eq('/1.0/oauth/token') }
  end
end
