require 'spec_helper'

describe OmniAuth::Strategies::Timely do
  # NOTE https://dev.timelyapp.com/ Accounts API section
  let(:raw_info) {
    {
      'id' => 1,
      'name' => 'Timely',
      'from' => 'Web',
      'max_users' => 45,
      'max_projects' => 0,
      'num_users' => 1,
      'num_projects' => 2,
      'plan_id' => 20,
      'plan_name' => 'Premium',
      'next_charge' => '2015-05-20',
      'currency' => {
        'id' => 'usd',
        'priority' => 1,
        'iso_code' => 'USD',
        'name' => 'United States Dollar',
        'symbol' => '$',
        'alternate_symbols' => ['US$'],
        'subunit' => 'Cent',
        'subunit_to_unit' => 100,
        'symbol_first' => true,
        'html_entity' => '$',
        'decimal_mark' => '.',
        'thousands_separator' => ',',
        'iso_numeric' => '840'
      }
    }
  }
  let(:dummy_rack_app) { [200, {}, ['dummy']] }
  let(:options) { {} }

  subject(:strategy) { OmniAuth::Strategies::Timely.new(dummy_rack_app, options) }

  describe 'options' do
    subject { strategy.options }

    it { expect(subject.name).to eq('timely') }
    it { expect(subject.client_options.site).to eq('https://api.timelyapp.com') }
    it { expect(subject.client_options.authorize_url).to eq('/1.0/oauth/authorize') }
    it { expect(subject.client_options.token_url).to eq('/1.0/oauth/token') }
  end

  describe '#info' do
    before do
      allow(strategy).to receive(:raw_info) { raw_info }
    end

    subject { strategy.info }

    it { expect(subject[:id]).to eq(1) }
    it { expect(subject[:name]).to eq('Timely') }
  end

  describe '#extra' do
    subject { strategy.extra }

    context 'skip_info enabled' do
      let(:options) { {skip_info: true} }

      before do
        allow(strategy).to receive(:raw_info) { raw_info }
      end

      it { expect(subject[:raw_info]).to be_nil }
    end

    context 'skip_info disabled' do
      before do
        allow(strategy).to receive(:raw_info) { raw_info }
      end

      it { expect(subject[:raw_info]).to eq(raw_info) }
    end
  end
end
