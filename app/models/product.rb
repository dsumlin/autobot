class Product < ActiveRecord::Base
    
    
    has_attached_file :image, :styles => { :small => "150x150>" }
        
    validates_attachment_presence :image
    validates_attachment_size :image, :less_than => 5.megabytes
    validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']    
    
    end

