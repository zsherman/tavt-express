class Plan < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  # attr_accessible :title, :body
end
