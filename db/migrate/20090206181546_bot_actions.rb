class CreateBotActions < ActiveRecord::Migration
  def self.up
    create_table "bot_actions", :force => true do |t|
      t.integer :user_request
      t.string :message
      t.timestamps
    end
  end

  def self.down
    drop_table "bot_actions"
  end

end
