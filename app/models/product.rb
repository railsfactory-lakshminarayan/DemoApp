class Product < ActiveRecord::Base
  attr_accessible :title, :description,:photo, :price
   has_many :line_items
   has_many :orders, :through => :line_items

has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  
  validates :title, :description, :photo, :presence => true
  validates :price, :numericality => true
 
  validates :title, :uniqueness => true
validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end

