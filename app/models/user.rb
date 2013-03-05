class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader   :password

  validate :password_must_be_present

  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user."
    end
  end

  # password is vairual attribute
  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end

  # use password and salt create an encrypt string and return it
  def User.encrypt_password(password,salt)
    Digest::SHA2.hexdigest(password + "ivan" + salt)
  end

  # 验证用户是否为合法用户
  def User.authenticate(name,password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password,user.salt)
        user
      end
    end
  end

  private

  def password_must_be_present
    errors.add(:password, "Missing Password") unless password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
