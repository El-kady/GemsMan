module Gemsman
  class OSDetector
    def detect
      @os ||= (
      case `cat /etc/*-release`
        when /CentOS/
          :centos
        when /Ubuntu/
          :ubuntu
        else
          raise Error::WebDriverError, "UNKNOWN OS"
      end
      )
    end
  end
end