require 'spec_helper'
require 'omniauth-bibles'

describe OmniAuth::Strategies::Bibles do
  def app; lambda{|env| [200, {}, ["Hello."]]} end
  let(:fresh_strategy) { Class.new(OmniAuth::Strategies::Bibles) }

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe %{when instantiated} do

    subject {fresh_strategy}
    let(:instance) {subject.new(app, :client_options => {})}

    it %{has the proper site url} do
      instance.client.site.should == %{https://accounts.bibles.org}
    end

    it %{has the proper authorize url} do
      instance.client.authorize_url.should == %{https://accounts.bibles.org/auth/queenbee/authorize}
    end

    it %{has the proper access token url} do
      instance.client.token_url.should == %{https://accounts.bibles.org/auth/queenbee/access_token}
    end
  end
end
