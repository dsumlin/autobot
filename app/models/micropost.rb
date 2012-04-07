class Micropost < ActiveRecord::Base
    
    
    
    
    attr_accessible :content, :banner
    
    
    belongs_to :user
    #paperclip
    has_attached_file :photo,
    :styles => {
    :thumb=> "100x100#",
    :small  => "400x400>" }
    
    
    validates :content, :presence => true, :length => { :maximum => 100 }
    validates :user_id, :presence => true

    
    default_scope :order => 'microposts.created_at DESC'
    
end
