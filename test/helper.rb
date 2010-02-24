require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'reflectorr'
# require everything in the 'fixtures/*' folders
Dir[File.dirname(__FILE__) + "/fixtures/**/*.rb"].each do |f|
  require f
end

class Test::Unit::TestCase
end
