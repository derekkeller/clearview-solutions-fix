class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  scope :investors, where('investor_id IS NOT NULL')
  scope :employees, where('investor_id IS NULL')
  
  # if the assignments were all there this would work
  #scope :investors, joins(:assignments).where('assignments.role_id = 3')
  #scope :employees, joins(:assignments).where('assignments.role_id in (1,2)')
  
  def has_role(role)
    self.roles.find_by_name(role)
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :first_name, 
                  :last_name,
                  :investor_id,
                  :user_type,
                  :notes

  belongs_to :investor

  has_many :participants
  has_many :events, :through => :participants

  has_many :folders
  has_many :tasks
  has_many :assignments
  has_many :roles, :through => :assignments

  accepts_nested_attributes_for :participants
  
  def to_s
    [first_name, last_name].join(' ')
  end

end
