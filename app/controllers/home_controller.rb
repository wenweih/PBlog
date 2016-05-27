class HomeController < ApplicationController
  def index
    @posts = Post.last(3)
    @book_first = Book.first
    @books = Book.limit(4).offset(1)
  end
end
