# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require "dropbox-api"
require "dropbox-api/tasks"
Dropbox::API::Tasks.install

namespace :dropbox do
  desc 'Generate thumbnails'
  task :thumbnails => :environment do
    dir = Rails.root.join 'app', 'assets', 'images'

    Image.find_each do |i|
      file = "#{dir}/#{i.title}_thumb.jpg"

      unless File.exist? file
        File.open(file, 'w+', encoding: 'ASCII-8BIT') { |f| f.write i.thumbnail_source }
        puts "Generated thumbnail for #{i.title}"
      end
    end
  end
end

LindaApp::Application.load_tasks
