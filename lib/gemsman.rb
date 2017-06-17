require "gemsman/version"
require "gemsman/collector"
require "gemsman/client"


module Gemsman
  class Manager

    def initialize
      @collector = Collector.new
      @client = Client.new
      # puts @collector.dependencies.map{ |s| s.name }
      #puts post('/',{}).inspect

      puts @client.query(['one', 'two'],'ubuntu').inspect
    end


  end
end
