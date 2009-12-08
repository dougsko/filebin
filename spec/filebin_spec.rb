require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Filebin" do
    it "uploads a file" do
        fbin = Filebin.new("path" => __FILE__)
        fbin.link.should match(/filebin_spec.rb/)
    end
end
