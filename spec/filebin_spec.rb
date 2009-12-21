require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Filebin" do
    it "uploads a file and returns a link" do
        fbin = Filebin.new("path" => __FILE__)
        fbin.link.should match(/filebin_spec.rb/)
    end

    it "returns a shortened verison of the link" do
        fbin = Filebin.new("path" => __FILE__)
        fbin.short_link.should match(/rubyurl.com\/\w+/)
    end
end
