class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :set_default_avatar


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments
  has_one_attached :avatar


  after_create :resize_avatar

  after_create :resize_avatar

  before_destroy :delete_comments, :update_article_author



  def resize_avatar
    return unless avatar.attached? # Verifica si hay una imagen de avatar adjunta

    avatar.variant(resize: '50x50^', crop: '50x50+0+0') do |v|
      v.gravity 'center'
      v.quality 100
    end
  end

  def set_default_avatar
    unless avatar.attached? # Verificar si no se ha adjuntado ninguna imagen de perfil
      default_image_path = Rails.root.join('public', 'default_avatar.png') # Ruta de la imagen por defecto
      self.avatar.attach(io: File.open(default_image_path), filename: 'default_avatar.png', content_type: 'image/png')
    end
  end

  private

  def delete_comments
    comments.destroy_all
  end
  def update_article_author
    articles.update_all(user_id: "elpepe")
  end
end
