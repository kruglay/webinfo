require "spec_helper"

RSpec.describe Webinfo do
  it "has a version number" do
    expect(Webinfo::VERSION).not_to be nil
  end

  it "#get_info should return array" do
    expect(Webinfo.get_info('https://www.facebook.com/', node: 'img', attr: 'src')).to be_a_kind_of(Array)
  end

  it "all elements of #get_info array should be string" do
    arr_images = Webinfo.get_info('https://www.facebook.com/', node: 'img', attr: 'src')
    expect(arr_images).to all be_a(String) if arr_images.count > 0
  end
end
