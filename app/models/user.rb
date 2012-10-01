class User < ActiveRecord::Base
  attr_accessible :active, :active, :city_id, :country_id, :description, :email, :full_name, :gender, :image, :password_hash, :password_salt, :phone
end
