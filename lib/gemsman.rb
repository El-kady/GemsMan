require "gemsman/version"

module Gemsman
  class Hello
    def say_hello
      puts 'This is moustafa agian. Coming in loud and clear. Over.'
      puts Gem::Specification.map {|gem| gem.name}
    end
  end
end
