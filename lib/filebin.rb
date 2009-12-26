#!/usr/bin/env ruby
#
# filebin.ca class
#

require 'rubygems'
require 'httpclient'
require 'net/http'
require 'hpricot'

class Filebin
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

    # Returns the link to the uploaded file.
    def link
        @link
    end

    # Returns a shortened link to the uploaded file.
    def short_link
        headers = {'Content-Type' => 'text/xml'}    
        xml = "<link><website_url>#{@link}</website_url></link>"
        res = Net::HTTP.start('rubyurl.com') do |http|
            http.post("/api/links", xml, headers)
        end
        doc = Hpricot(res.body)
        doc.at('/permalink').inner_html
    end 
end
