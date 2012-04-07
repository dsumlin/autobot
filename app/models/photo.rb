class photo < ActiveRecord::Base
    
    
    
    
    attr_accessible :content, :photo
    
    
    belongs_to :microposts, :user
    
    validates :photo, :presence => true

    
       
    default_scope :order => 'microposts.created_at DESC'
    
end
