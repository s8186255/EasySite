class User
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Tree
  #include ReferralExt
  #after_save :create_referral
  #新增虚拟字段 可以使用mobile或username进行登录
  attr_accessor :login
  attr_accessor :code
  #新增字段
  field :mobile,           type: String
  field :username,           type: String
  field :nickname,           type: String


  has_one :referral

  #扩展user
  include UserExt
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,
         :authentication_keys => [:login]

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  field :locked_at,       type: Time

  # validataes
  validates_uniqueness_of :mobile
  validates_uniqueness_of :username
  # index
  index({ mobile: 1 }, { unique: true })



  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      self.any_of({ :username =>  /^#{Regexp.escape(login)}$/i }, { :mobile =>  /^#{Regexp.escape(login)}$/i }).first
    else
      super
    end
  end

private
#创建user同时创建referral推广
  def create_referral
    self.referral = Referral.new unless self.referral
  end

end
