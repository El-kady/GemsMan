require "gemsman/request"
require "json"

module Gemsman
  class Client
    include Gemsman::Request
    def initialize
    end

    def query(gems,os)
       response = post('/api/query',{ 'gems[]' => gems,os: os})
       JSON.parse(response)
    end
  end
end