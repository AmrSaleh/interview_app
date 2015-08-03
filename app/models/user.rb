class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body
  
  has_many :interviewees
  has_many :interviewers
  
  # EXAMPLE ON ONE-to-ONE Relation
  # ===============================
  # class User < ActiveRecord::Base
  # has_one :car, :class_name => 'Car', :foreign_key => 'user_id'
  # 
  # class Car < ActiveRecord::Base
  # belongs_to :worker, :class_name => 'User', :foreign_key => 'user_id'
  
end
