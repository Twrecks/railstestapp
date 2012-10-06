class AddAttachment < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :postfile
  end

  def self.down
    remove_attachment :posts, :postfile
  end
end
