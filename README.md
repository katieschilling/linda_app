# README

This webapp uses Dropbox for content management and serves as a repository for the artist's images. 

Thumbnails are stored on S3, and use of Cloudfront as the CDN is forthcoming.

A task on Heroku Scheduler updates the images every night, and updating tasks are also available as rake tasks.
