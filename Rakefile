# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require "dropbox-api"
require "dropbox-api/tasks"
Dropbox::API::Tasks.install

namespace :dropbox do
  desc 'Generate thumbnails'
  task :thumbnails => :environment do
    Image.find_each do |img|
      thumbnail = s3.objects["thumbs/#{img.title}.jpg"]
      unless thumbnail.exists?
        thumbnail.write img.thumbnail_source
        thumbnail.acl = :public_read
        puts "Uploaded thumbnail for #{img.title}"
      end
    end
  end
end

LindaApp::Application.load_tasks
