class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:student, :processor, :admin, :superuser]

  private

  def create_token
    begin
     self.token = SecureRandom.hex[0,20].upcase
     rescue ActiveRecord::RecordNotUnique
       retry
    end
  end

end
