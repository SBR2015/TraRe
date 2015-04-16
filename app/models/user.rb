class User < ActiveRecord::Base

  # model relationship
  belongs_to :native_language,
             class_name: 'Language',
             foreign_key: 'native_language_id'

  belongs_to :best_language,
             class_name: 'Language',
             foreign_key: 'best_language_id'

  has_many :my_resumes,
           class_name: 'Resume',
           foreign_key: 'owner_id'

  has_many :translated_resumes,
           class_name: 'Resume',
           foreign_key: 'translator_id'


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
