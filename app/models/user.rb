class User < ApplicationRecord

  # has_many :atmcards
  # has_many :billings
  has_many :cards

  # mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # User Avatar Validation
  # validates_integrity_of  :avatar
  # validates_processing_of :avatar


  # has_one_attached :avatar

  # after_commit :add_default_avatar, on: %i[create update]

  # def avatar_thumbnail
  #   if avatar.attached?
  #      avatar.variant(resize: "150*150!").processed
  #   else
  #     "/undraw_profile.svg"
  #   end
  # end



  # private
  # def add_default_avatar
  #   unless avatar.attached?
  #     avatar.attach(
  #       io: File.open(
  #         Rails.root.join(
  #           'app', 'assets', 'images', 'undraw_profile.svg'
  #         )
  #       ), 
  #       filename: 'undraw_profile.svg',
  #       content_type: 'image/jpg'
  #     )
  #   end
  # end

  # def avatar_size_validation
  #   errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  # end
end
