class User < ActiveRecord::Base
  # kakurenbo-puti
  soft_deletable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  # relation
  has_one :credit, dependent: :destroy
  has_many :addresses
  has_many :orders
  has_many :reviews
  has_many :items, through: :reviews

  # validation
  validates :password,
    format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,126}+\z/i }



  # logical-delete user
  def logical_delete
    # aaa=fawea;
    update_attribute(:soft_destroyed_at, Time.current)

    # また、userのメールアドレスの頭にleave_atを追加する。
    # メールアドレスを変更すると原則確認メールが送信されるため、
    # 送信をスキップすることを宣言した上でupdateする。
    new_email = Time.current.to_s + '_' + self.email.to_s
    self.skip_reconfirmation!
    self.update_attribute(:email, new_email)

    # また、social_profilesが存在する場合はuidの頭にもleave_atを追加する
    # fb,twitter両方連携されている場合があるため、each doしている。
    unless self.uid.blank?
      uid = self.uid + '_' + Time.current.to_s
      self.update_attribute(:uid, uid)
    end
    # social_profiles.each do |sp|
    #   new_uid = self.leave_at.to_i.to_s + '_' + sp.uid.to_s
    #   sp.update_attribute(:uid, new_uid)
    # end
  end


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end



  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
