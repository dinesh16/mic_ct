# frozen_string_literal: true

module Api
  class Lead < Connection
    def submit(params)
      api_response(
        :post,
        lead_api_endpoint,
        params.merge(api_access_credentials)
      ).symbolize_keys
    end

    private

    def api_access_credentials
      {
        'access_token' => config_val(:lead_api_access_token),
        'pGUID' => config_val(:lead_api_pguid),
        'pAccName' => config_val(:lead_api_paccname),
        'pPartner' => config_val(:lead_api_ppartner)
      }
    end

    def config_val(key)
      Rails.application.config.send(key)
    end

    def lead_api_endpoint
      '/api/v1/create'
    end
  end
end
