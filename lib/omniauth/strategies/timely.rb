require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Timely < OmniAuth::Strategies::OAuth2
       API_VERSION = "1.1".freeze
      
      option :name, "timely"
      option :client_options, {
        site: "https://api.timelyapp.com",
        authorize_url: "/#{API_VERSION}/oauth/authorize",
        token_url: "/#{API_VERSION}/oauth/token"
      }

      uid { raw_info['id'] }

      info do
        {
          name: raw_info['name'],
          id: raw_info['id']
        }
      end

      extra do
        skip_info? ? {} : {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get("/#{API_VERSION}/accounts", parse: :json).parsed.first
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
