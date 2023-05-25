class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  def user_name
    user&.nil? ? "Cuenta Eliminada" : user&.name
  end
end
