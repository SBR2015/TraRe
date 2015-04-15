class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # error if below contents isn't unique words
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true


  # get method for User information
  # def self.get_user_info(username)
  #
  #   ret_data = {
  #     # username: username,
  #     # email: email
  #   }
  #
  #   return ret_data
  # end

end
