class User < ApplicationRecord
    #1 bake in prereqs of Auth
    
    # FIGVAPER
    # F - find_by_credentials
    # I - is_password?
    # G - generate_session_token
    # V - validations
    # A - attr_reader :password
    # P - password=
    # E - ensure_session_token
    # R - reset_session_token!

    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6, allow_nil: true }

    attr_reader :password #doesnt exist on the table but attr_reader needed to validate

    def self.find_by_credentials(email, password)
        @user = User.find_by(email: email) #user doesnt have a password
        return @user if @user && @user.is_password?(password)
        nil
    end

    def is_password?(password) #password_digest is hashlike item 
        BCrypt::Password.new(self.password_digest).is_password?(password) #.is_password is another method
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token! #self becuse of the current instance
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password) ##.create takes any string. .new only takes a hashed value
        @password = password
        self.password_digest = BCrypt::Password.create(password) #password digest is an attribute you can call on self
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end
