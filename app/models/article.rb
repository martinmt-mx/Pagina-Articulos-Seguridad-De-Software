class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user, optional: true
  has_many :category_articles
  has_many :categories, through: :category_articles
  has_many :comments, dependent: :destroy

  attr_accessor :category_elements



  def save_categories

    return category_articles.destroy_all if category_elements.nil? || category_elements.empty?

    category_articles.where.not(category_id: category_elements).destroy_all

    # category_elements
    category_elements.each do |category_id|

      CategoryArticle.find_or_create_by(article: self, category_id: category_id)

    end

  end

  def remove_category_association
    category_article = CategoryArticle.find_by(article_id: id)
    category_article.destroy if category_article
  end

end
