require 'sinatra/base'
require 'redis-sinatra'
require 'sinatra'

class RedisCache < Sinatra::Base
  register Sinatra::Cache

  def self.execute_cache(redis_key, &block)
    settings.cache.fetch(redis_key) { block.call }
  end
end