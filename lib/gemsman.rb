require "gemsman/version"
require "gemsman/collector"


module Gemsman
  class Manager
    def initialize
      @collector = Collector.new
      puts @collector.dependencies.map{ |s| s.name }
    end


  end
end
