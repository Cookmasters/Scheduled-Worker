# frozen_string_literal: true

require 'econfig'

require_relative '../init.rb'

extend Econfig::Shortcut
Econfig.env = ENV['WORKER_ENV'] || 'development'
Econfig.root = File.expand_path('..', File.dirname(__FILE__))

# module RecipeBuddy
#   # Class to update recipes on the database
#   class UpdateRecipes
# Get a list of All pages
gateway = RecipeBuddy::ApiGateway.new(config)
pages_json = gateway.all_pages.message
pages_data = RecipeBuddy::PagesRepresenter.new(OpenStruct.new)
                                          .from_json pages_json

pages_data.pages.each do |page|
  if page.request_id.nil?
    pagename = page.name
    gateway.update_page(pagename)
  end
end
