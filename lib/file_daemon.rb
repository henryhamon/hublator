#!/usr/bin/env ruby

# convert a daemon to a cron job
#
RAILS_ENV="production"
require File.join(File.dirname(__FILE__), "..", "config", "environment.rb")
#require "simple-daemon"
require "gdata_convert.rb"

class FileDaemon #< SimpleDaemon::Base

# SimpleDaemon::WORKING_DIRECTORY = "#{RAILS_ROOT}/tmp"

  def self.start
    loop do
      date = Time.new.strftime('%Y-%m-%d %H:%M:%S')
      project = Project.find(:first,
                              :conditions => { :status => 'pending' },
                              :order => ["created_at ASC"])

      unless project.nil?
        project.working!
        doc = GDataConvert::Document.new(project.name, "#{RAILS_ROOT}/public/#{project.attachment.url}", project.attachment_content_type)
        doc.pages.each_with_index do |page, i|
          Page.create!(:project_id => project.id,
                       :language_id => project.language_id,
                       :page_number => i+1,
                       :content => page,
                       :finished => 0,
                       :created_at => date,
                       :updated_at => date)
        end


        project.processed!
      end

      sleep(30)
    end
  end

  def self.stop
  end
end

#FileDaemon.daemonize
#
FileDaemon.start

