class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :first_name, :last_name, :organization, :work_id, :admin

  has_many :challenges, :dependent => :destroy

  #Check if user is admin
  def admin?
    return  read_attribute(:admin) == 1
  end
end
