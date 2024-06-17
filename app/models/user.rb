require 'bcrypt'
class User < ApplicationRecord
    include BCrypt

    # attr_accessor :email, :name

    def password
        @password ||= Password.new(password_hash)
    end
    
    def password=(new_password)
        @pass = Password.create(new_password)
        # puts @pass
        self.password_hash = @pass
    end
end
