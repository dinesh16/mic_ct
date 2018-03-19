# frozen_string_literal: true

module ApiHelper
  def stub_api_request(result)
    stub_request(:any, api_url).to_return(body: result, headers: default_headers)
  end

  def api_url
    Rails.application.config.lead_api_base_uri + '/create'
  end

  def default_headers
    { 'Content-Type' => 'application/json' }
  end

end

RSpec.configure do |config|
  config.include ApiHelper
end
