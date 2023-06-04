class HomeController < ApplicationController
  def index
    @articles = Article.order('RANDOM()').limit(8)
  end
end
