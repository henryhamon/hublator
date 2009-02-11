#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

require "pbt_stream/search"
require "pbt_stream/buffer"

require File.dirname(__FILE__) + "/../../config/environment"

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  
  search = PbtStream::Search.new(:pbtweet, :game) 
  search.populate_buffer()

  bot = PbtStream::Search.new(:pbtweetbot, :bot) 
  bot.populate_buffer()

  ActiveRecord::Base.logger.info "Populate TweetBuffer - This daemon is still running at #{Time.now}.\n"
  PbtStream::Buffer.clear_resolved()
  
  sleep 10
end
