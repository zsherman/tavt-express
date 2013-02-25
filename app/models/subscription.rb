class Subscription < ActiveRecord::Base
  attr_accessible :user_id, :plan_id, :active
  belongs_to :plan
  belongs_to :user
  validates_presence_of :plan_id
end
