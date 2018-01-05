# frozen_string_literal: true

require 'roar/decorator'
require 'roar/json'
require 'ostruct'

Dir.glob("#{File.dirname(__FILE__)}/*.rb").each do |file|
  require file
end
