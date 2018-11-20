require 'rest-client'
require 'json'
require 'execjs'
require 'active_support/all'

Dir[File.dirname(__FILE__) + '/m_translator/*.rb'].each {|file| require file }

module MTranslator
  class Error < StandardError; end
  # Your code goes here...
end
