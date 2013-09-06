require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Bibles < OmniAuth::Strategies::OAuth2
      class NoAuthorizationCodeError < StandardError; end

      ACCOUNTS_URL = 'https://accounts.bibles.org'

      option :client_options, {
        :site             => ACCOUNTS_URL,
        :authorize_url    => %{#{ACCOUNTS_URL}/auth/queenbee/authorize},
        :token_url => %{#{ACCOUNTS_URL}/auth/queenbee/access_token}
      }

      uid { raw_info['id'] }

      info do
        {
          :email => raw_info['info']['email']
        }
      end

      extra do
        {
          :name => raw_info['extra']['name']
        }
      end

      def raw_info
        @raw_info ||= access_token.get(%{/auth/queenbee/user.json}).parsed
      end
    end
  end
end
