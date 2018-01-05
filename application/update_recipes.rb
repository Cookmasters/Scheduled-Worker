# frozen_string_literal: true

require 'econfig'

require_relative '../init.rb'

extend Econfig::Shortcut
Econfig.env = ENV['WORKER_ENV'] || 'development'
Econfig.root = File.expand_path('..', File.dirname(__FILE__))

ENV['API_HOST']= config.API_HOST
ENV['API_VER'] = config.API_VER
ENV['APP_URL'] = config.APP_URL

# module RecipeBuddy
#   # Class to update recipes on the database
#   class UpdateRecipes
# Get a list of All pages
pages_json = RecipeBuddy::ApiGateway.all_pages.message
pages = RecipeBuddy::PagesRepresenter.new(OpenStruct.new).from_json pages_json

pages.pages.each do |index|
  if index.request_id.nil?
    pagename = index.name
    RecipeBuddy::ApiGateway.update_page(pagename)
  end
end
