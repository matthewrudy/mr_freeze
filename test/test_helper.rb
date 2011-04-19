require 'rubygems'
require 'test/unit'
require 'active_support/testing/declarative'

$:.unshift File.expand_path(File.dirname(__FILE__)+"/../lib")

class Test::Unit::TestCase
  extend ActiveSupport::Testing::Declarative
end