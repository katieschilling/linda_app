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
      unless dropbox.ls('images_website/thumbs').find { |e| e.path == img.dropbox_path }
        dropbox.upload "images_website/thumbs/#{img.title}.jpg", img.thumbnail_source
        puts "Uploaded thumbnail for #{img.title}"
      end
    end
  end
end

LindaApp::Application.load_tasks
