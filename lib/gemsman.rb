require "gemsman/version"
require "gemsman/collector"
require "gemsman/request"


module Gemsman
  class Manager
    include Gemsman::Request
    def initialize
      # @collector = Collector.new
      # puts @collector.dependencies.map{ |s| s.name }
      puts post('/',{}).inspect
    end


  end
end
