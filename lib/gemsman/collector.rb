require "pathname"
require "bundler"

module Gemsman
  class Collector
    def initialize
      @project_path = Pathname.pwd.expand_path
    end

    def definition
      @definition ||= ::Bundler::Definition.build(gemfile_path, lockfile_path, nil)
    end

    def dependencies
      @bundler_details ||= definition.dependencies
    end

    def gemfile_path
      @project_path.join('Gemfile')
    end

    def lockfile_path
      @project_path.join('Gemfile.lock')
    end

  end
end
