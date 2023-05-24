class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :set_default_avatar


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments
  has_one_attached :avatar

  def set_default_avatar
    unless avatar.attached? # Verificar si no se ha adjuntado ninguna imagen de perfil
      default_image_path = Rails.root.join('public', 'default_avatar.png') # Ruta de la imagen por defecto
      self.avatar.attach(io: File.open(default_image_path), filename: 'default_avatar.png', content_type: 'image/png')
    end
  end
end
