class TweetBufferLogs < ActiveRecord::Migration
  def self.up
    create_table "tweet_buffer_logs", :force => true do |t|
      t.integer :results 
      t.integer :max_id 
      t.integer :since_id 
      t.string  :refresh_url 
      t.integer :results_per_page 
      t.integer :page 
      t.string  :completed_in 
      t.string  :query
      t.string  :type #pbtbot or pbttweet (game)
      t.timestamps
    end
  end

  def self.down
    drop_table :tweet_buffer_logs
  end
end
