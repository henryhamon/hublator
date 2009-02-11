class TweetBuffers < ActiveRecord::Migration
  def self.up
    create_table "tweet_buffers", :force => true do |t|
      t.references :tweet_buffer_log
      t.boolean    :processed, :default => false
      t.string     :profile_image_url 
      t.datetime   :tweet_created_at 
      t.string     :from_user , :limit => 50 
      t.string     :text 
      t.integer    :to_user_id 
      t.integer    :tweet_id
      t.string     :to_user, :limit => 50
      t.integer    :from_user_id
      t.string     :iso_language_code, :limit => 5
      t.timestamps
    end
  end

  def self.down
    drop_table :tweet_buffers
  end
end
