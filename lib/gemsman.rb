require "gemsman/version"
require "gemsman/collector"
require "gemsman/client"
require "gemsman/osdetector"

module Gemsman
  class Manager

    def initialize
      # get a new instance from the collector class to get Gemfile dependencies
      collector = Collector.new
      # get the dependencies
      dependencies = collector.dependencies.map{ |s| s.name }
      # get a new instance from Client to call API
      client = Client.new
      # get a new instance from OSDetector
      osdetector = OSDetector.new
      os = osdetector.detect

      puts "#{os.to_s.capitalize} Detected ..."
      puts "Collecting Dependencies ..."

      gems = client.query(dependencies, os.to_s)

      if gems.count == 0
        puts "No required system libraries to be installed"
      else
        gems.each {|gem|
          puts "- [#{gem["name"]}] Depending on #{gem["libraries"].join(", ")}"
        }
        # Install libraries using system CMD (http://shiroyasha.io/running-shell-commands-from-ruby.html)
        puts "Install libraries (y/n) ?"
        answer = gets.chomp
        if answer == "y"
          gems.each {|gem|
            gem["libraries"].each { |library|
              case os
                when :centos
                  system "sudo yum install #{library}"
                  install_status library
                when :ubuntu
                  system "sudo apt-get -y install #{library}"
                  install_status library
                else
                  raise Error::WebDriverError, "UNKNOWN OS"
              end

            }
          }
        end
      end
    end

    def install_status(library)
      if $?.exitstatus == 0
        puts "#{library} installed"
      else
        puts "Failed to install #{library}"
      end
    end

  end
end
