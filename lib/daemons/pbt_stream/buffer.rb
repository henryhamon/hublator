module PbtStream
  class Buffer    
    def populate(tweet, log)
      tweets = TweetBuffer.create!({:tweet_buffer_log_id => log,
                                    :profile_image_url => tweet.profile_image_url,
                                    :tweet_created_at => tweet.created_at,
                                    :from_user => tweet.from_user,
                                    :text => tweet.text,
                                    :to_user_id => tweet.to_user_id,
                                    :tweet_id => tweet.id,
                                    :to_user => tweet.to_user,
                                    :from_user_id => tweet.from_user_id,
                                    :iso_language_code => tweet.iso_language_code})
    end

    def clear_resolved(type)
      tweets = TweetBuffer.find(:all, :conditions['type ? AND resolved ?', type, true])
      tweets.each {|t| t.destoy }
    end

    def get_buffer_log(type)
      TweetBufferLog.find(:last, :conditions => ['type ?', type])
    end

    def set_buffer_log(*params, type)
      TweetBufferLog.create!({:results => params.results.count,
                              :max_id => params.max_id,
                              :since_id => params.since_id,
                              :refresh_url => params.refresh_url,
                              :results_per_page => params.results_per_page,
                              :page => params.page,
                              :completed_in => params.completed_in,
                              :query => params.query,
                              :type => type})
    end   
  end
end
