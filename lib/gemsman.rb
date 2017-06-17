require "gemsman/version"
require "gemsman/collector"
require "gemsman/client"


module Gemsman
  class Manager

    def initialize
      # get a new instance from the collector class to get Gemfile dependencies
      @collector = Collector.new
      # get a new instance from Client to call API
      @client = Client.new
      # get the dependencies
      dependencies = @collector.dependencies.map{ |s| s.name }

      puts "Collecting Dependencies ..."

      gems = @client.query(dependencies,'ubuntu')
      gems.each {|gem|
          puts "- [#{gem["name"]}] Depending on #{gem["libraries"].join(",")}"
      }
    end


  end
end
