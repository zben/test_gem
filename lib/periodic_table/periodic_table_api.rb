require 'savon'
require 'active_support/inflector'

module PeriodicTable
  class PeriodicTableApi
    def initialize
      Savon.config.log = false
      HTTPI.log = false
      @client = Savon::Client.new do
        wsdl.document = "http://www.webservicex.net/periodictable.asmx?WSDL"
      end
    end

    def query(element_name)

      api_response = @client.request :get_atomic_number do
        soap.body = {'ElementName' => element_name}
      end
      result = api_response.to_hash[:get_atomic_number_response][:get_atomic_number_result]
      ApiResponse.new(result)
    end
  end

  class ApiResponse
    PROPERTIES = [:atomic_weight,
                  :symbol,
                  :atomic_number,
                  :element_name,
                  :boiling_point,
                  :ionisation_potential,
                  :electro_negativity,
                  :atomic_radius,
                  :melting_point,
                  :density]

    def initialize(result)
      @xml = Nokogiri::XML.parse(result)
    end

    PROPERTIES.each do |property|
      define_method(property) do
        @xml.at(property.to_s.camelize).text
      end
    end
  end
end
