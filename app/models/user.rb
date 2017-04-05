class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def create_token
    begin
     self.token = SecureRandom.hex[0,10].upcase
     rescue ActiveRecord::RecordNotUnique
       retry
    end
  end
  
end
