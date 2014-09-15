Dropbox::API::Config.app_key    = ENV['DROPBOX_APP_KEY']
Dropbox::API::Config.app_secret = ENV['DROPBOX_APP_SECRET']
Dropbox::API::Config.mode       = "dropbox"

def dropbox
	@dropbox ||= Dropbox::API::Client.new token: ENV['DROPBOX_TOKEN'], secret: ENV['DROPBOX_SECRET']
end

def dropbox_directories
	dropbox.ls('images_website')
end
