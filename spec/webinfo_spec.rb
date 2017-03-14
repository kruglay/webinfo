require "spec_helper"

RSpec.describe Webinfo do
  it "has a version number" do
    expect(Webinfo::VERSION).not_to be nil
  end

  it "#get_info should return array" do
    expect(Webinfo.get_info('https://www.facebook.com/', node: 'img', attr: 'src')).to be_a_kind_of(Array)
  end

  it "all elements of #get_info array should be attributes of img node" do
    nodes_name = []
    response = HTTParty.get('https://www.facebook.com/')
    doc = Nokogiri::HTML(response)
    arr_images = Webinfo.get_info('https://www.facebook.com/', node: 'img', attr: 'src')
    arr_attr = doc.xpath("//@src")
    arr_images.each {|addr| nodes_name.push(doc.xpath("//*[@src='#{addr}']").first.name)}

    expect(nodes_name).to all eq('img')
  end
end
