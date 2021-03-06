class Question < ActiveRecord::Base
  attr_accessible :topic_id, :question, :option_a, :option_b, :option_c, :option_d, :answer, :user_id

  #association
  belongs_to :topic
  belongs_to :user
  has_many :testquestions

  #validation
  validates_associated :testquestions
  validates :user_id, :presence => true
  validates :topic_id, :presence => true
  validates :question, :presence => true
  validates :option_a, :presence => true
  validates :option_b, :presence => true
  validates :option_c, :presence => true
  validates :option_d, :presence => true
  validates :answer, :presence => true, :inclusion => { :in => %w(a b c d),
    :message => "answer must in options" }
  
  #callback
  before_validation :validate_topic, :validates_user

  def validate_topic
    errors.add(:topic_id, 'Chapter\'s topic not presence') if Topic.find_by_id( self[:topic_id] ) == nil
  end

  def validates_user
    errors.add(:user_id, 'not presence') if User.find_by_id( self[:user_id] ) == nil
  end

end
