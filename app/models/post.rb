class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes, :postfile
    
  #has_attached_file :postfile, :styles => { :medium => "300x300", :thumb => "100x100" }
  has_attached_file :postfile, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_size :postfile, :less_than => 10.megabytes
  validates_attachment_content_type :postfile, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/JPG']
  
  validates :name,  :presence => true
  validates :title, :presence => true,
                      :length => { :minimum => 5 }
                      
  has_many :comments, :dependent => :destroy
  has_many :tags
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
      :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
