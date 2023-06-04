require_relative '../test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(title: 'Sample Article', content: 'This is a sample article.')
  end

  test 'should be valid' do
    assert @article.valid?
  end

  test 'title should be present' do
    @article.title = ''
    assert_not @article.valid?
  end

  test 'content should be present' do
    @article.content = ''
    assert_not @article.valid?
  end

  test 'title should not be too long' do
    @article.title = 'a' * 51
    assert_not @article.valid?
  end

  test 'content should not be too long' do
    @article.content = 'a' * 1001
    assert_not @article.valid?
  end
end
