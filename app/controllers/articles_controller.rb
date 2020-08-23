class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @articles = Article.all.page(params[:page]).per(4)
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:page]).per(4)
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if params[:back]
      render :new
    else
      if @article.save
        redirect_to articles_path, notice: "作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @article = Article.find(params[:id])
    @favorite = current_user.favorites.find_by(article_id: @article.id)
    @comments = @article.comments
    #@comment = @article.comments.build
    @comment = @article.comments.build
    # @comment = Comment.new(article_params)
    # @comment.user_id = current_user.id
    @count = Favorite.where(article_id: @article.id).count
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, alert: ('コメントが削除されました')
  end


  def confirm
    @article = Article.new(article_params)
    @article.id = params[:id]
    render :new if @article.invalid?
  end

  private
  def article_params
    params.require(:article).permit(:title, :content , :id, :image, :image_cache)
  end

end
