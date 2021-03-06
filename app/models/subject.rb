class Subject < ActiveRecord::Base
  attr_accessible :user_id, :name
  #association
  has_many :teachers
  has_many :chapters
  has_many :jktests
  belongs_to :user
  
  #validations
  validates :user_id, :presence => true
  validates :name, :presence => true, :uniqueness => true
  validates_associated :teachers
  validates_associated :chapters
  validates_associated :jktests
  
  before_validation :validate_user

  #function validates user is exist or not in user table
  def validate_user
    errors.add(:user_id, 'not presence') if User.find_by_id( self[:user_id] ) == nil
  end
end
