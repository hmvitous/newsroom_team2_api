# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  validates_presence_of :role, :name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
