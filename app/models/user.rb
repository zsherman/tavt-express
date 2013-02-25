class User < ActiveRecord::Base
  belongs_to :plan
  has_one :subscription
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :city, :state, :address, :active, :category, :zip_code,
                  :tax_id, :first_name, :last_name, :website_url, :business_name, :plan_id, :active
end
