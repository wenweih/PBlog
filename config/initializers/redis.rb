require 'redis'
require 'redis-namespace'
require 'redis/objects'

redis_connection = Redis.new(:url => 'redis://127.0.0.1:6379/0/cache')
$redis = Redis::Namespace.new("mypage", :redis => redis_connection)
Redis::Objects.redis = $redis
