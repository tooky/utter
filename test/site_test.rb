require File.dirname(__FILE__) + '/test_helper'

class SiteTest < Test::Unit::TestCase
  context "A new site" do
    setup do
      @site = Utter::Site.new :name => 'tooky.github.com', 
                              :source => File.join(tmp_dir, 'tooky.github,com'), 
                              :destination => File.join(tmp_dir, 'tooky.github,com', 'public'), 
                              :repo => 'git@github.com:tooky/tooky.github.com.git'
    end
    
    should "not have a key" do
      assert ! @site[:key]
    end
    
    should "generate a key after create" do
      @site.save
      assert @site[:key]
    end
  end
end