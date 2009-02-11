module PbtStream
  class Search

    def initialize(query, type)
      raise ArgumentError, "Params query and type are nil" if(query.nil? and type.nil)
      @@query = query
      @@type = type
    end

    def populate_buffer
      result = search
      log = PbtStream::Buffer.set_buffer_log(result, @@type)

      result.results.each do |r|
        PbtStream::Buffer.populate(r, log.id)
      end if result.results.count > 0
    end

    private
    def search
      search = Twitter::Search.new
      search.hashed(@@query)
      search.since(get_last_tweet) if get_last_tweet > 0 
      search.fetch()
    end

    def get_last_tweet
      tweet = PbtStream::Buffer.get_buffer_log(@@type)  
      if tweet.nil? 
        return 0 
      else 
        return tweet.max_id 
      end
    def
  end
end
