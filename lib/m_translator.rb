require 'rest-client'
require 'json'
require 'execjs'
require 'active_support/all'
require "m_translator/version"
require 'm_translator/youdao'
require 'm_translator/google'

module MTranslator
  class Error < StandardError; end
  # Your code goes here...
end
