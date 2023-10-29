#!/usr/bin/env ruby

require 'uri'
require 'net/http'
require 'json'
require_relative 'console_table'

next_feature_rating = {'fresh': 70, 'upcoming': 80, 'popular': 90 }
results = []

uri = URI('https://api.500px.com/v1/photos?feature=user&username=apo_orvajain&tags=1')
res = Net::HTTP.get_response(uri)
photos = JSON.parse(res.body)["photos"]

photos.each do |photo|
    # pic_uri = URI("https://api.500px.com/v1/photos/#{photo['id']}?tags=1")
    # pic_res = Net::HTTP.get_response(pic_uri)

    # body = OpenStruct.new JSON.parse(pic_res.body)["photo"]
    # puts photo
    body = OpenStruct.new photo
    to_go = next_feature_rating[body.feature.to_sym] - body.highest_rating.to_f
    results << [body.name, body.feature.capitalize, body.highest_rating, body.times_viewed]

    # print '#'
    # sleep 0.1
end

puts ""
ConsoleTable.print(results)

# pic_uri = URI("https://api.500px.com/v1/photos/1065386742?tags=1")
# pic_res = Net::HTTP.get_response(pic_uri)
# puts JSON.parse(pic_res.body)["photo"]["tags"]

