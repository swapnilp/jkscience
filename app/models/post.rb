class Post < ActiveRecord::Base
  attr_accessible  :post, :user_id, :forum_id, :post_post_id
  
  #association
  belongs_to :forum
  belongs_to :user

  #validation
  validates :post, :presence => true
  validates :forum_id, :presence => true
  validates :user_id, :presence => true
  
  #callback
  before_validation :validate_user, :validate_forum

  #this function add the error if user not exist in user table
  def validate_user
    errors.add(:user_id, 'User not presence') if User.find_by_id( self[:user_id] ) == nil
  end

  #this function add the error if forum not present in forum table
  def validate_forum
    errors.add(:forum_id, 'Forum not presence') if Forum.find_by_id( self[:forum_id] ) == nil
  end
end
