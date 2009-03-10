require 'flickr_fu'
class Connector
  def self.start
    Flickr.new(RAILS_ROOT + '/config/flickr.yml')
  end
end