require "webinfo/version"
require "httparty"
require "nokogiri"

class Webinfo
  #addr - site address
  #options - {:node ,:attr}
  def self.get_info(addr, options = {})
    response = HTTParty.get(addr)
    doc = Nokogiri::HTML(response)
    nodes_images = doc.xpath("//#{options[:node]}")
    nodes_images.map {|i| i[options[:attr]]}.compact.uniq
  end
end
