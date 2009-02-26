require 'jekyll'
require 'git'
require 'sequel'
require 'digest/sha1'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://utter.db')

require 'utter/site'
require 'utter/application'

module Utter
  Site.make_table
  Salt = 'd42ab5ae256429c2d1928763606554ebc46f6565'
end
