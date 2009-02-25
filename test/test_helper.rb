require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'time'

ENV['DATABASE_URL'] = "sqlite:///"

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'utter'

class Test::Unit::TestCase
  def tmp_dir
    File.join(File.dirname(__FILE__), 'tmp')
  end
end
