# frozen_string_literal: true

class Connection
  BASE_URL = Rails.application.config.lead_api_base_uri

  def api_response(method, endpoint, params)
    response = connection.send(method, endpoint, params)
    response.body
  rescue Faraday::Error => e
    Rails.logger.error(e.message)
    { errors: [I18n.t(:service_not_available)] }
  end

  private

  def connection
    @connection ||= Faraday.new(url: BASE_URL) do |conn|
      conn.response :json, content_type: 'application/json'
      conn.request :url_encoded
      conn.adapter :net_http
    end
  end
end
