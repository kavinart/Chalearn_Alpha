class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :first_name, :last_name, :organization, :work_id, :role

  has_many :challenges, :dependent => :destroy
  # attr_accessible :title, :body
  def admin?
    return  read_attribute(:role) == 'admin'
  end

  def moderator?
    return  read_attribute(:role) == 'moderator'
  end

  def organizer?
    return  read_attribute(:role) == 'organizer'
  end

  
end
