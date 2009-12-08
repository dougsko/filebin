#!/usr/bin/env ruby
#
# filebin.ca class
#

require 'rubygems'
require 'httpclient'
require 'hpricot'

class Filebin
    attr_reader :link
    # This method takes a hash containing the variables in the POST
    # request.
    #
    #   fbin = Filebin.new({ "path" => "file_path"})
    #
    def initialize(options)
        options["MAX_FILE_SIZE"] = "82428800"

        # Get UPLOAD_IDENTIFIER
        clnt = HTTPClient.new
        res = clnt.get('http://filebin.ca').content
        doc = Hpricot(res)
        options["UPLOAD_IDENTIFIER"] = doc.at("//div[@id='form']/fieldset/form/input[2]")['value']

        # Upload file
        File.open(options["path"]) do |file|
            options["file"] = file
            options.delete("path")
            clnt = HTTPClient.new
            res = clnt.post('http://filebin.ca/upload.php', options).content
            doc = Hpricot(res)
        end

        doc.inner_html.match(/file is available at (.*)\n/)
        @link = $1
    end
end
