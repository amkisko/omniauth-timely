require 'omniauth/strategies/oauth2'

module Omniauth
  module Strategies
    class Timely < OmniAuth::Strategies::OAuth2
      option :name, 'timely'
      option :client_options, {
        site: 'https://api.timelyapp.com',
        authorize_url: '/1.0/oauth/authorize',
        token_url: '/1.0/oauth/token'
      }

      uid { raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :id => raw_info['id']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/1.0/accounts', parse: :json).parsed.first
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
