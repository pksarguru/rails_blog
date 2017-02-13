class CommentsController < ApplicationController

  http_basic_authenticate_with name: "pavan", password: "password", only: :destroy

  def create
    # where does article_id come from?
    @article = Article.find_by(id: params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find_by(id: params[:article_id])
    @comment = @article.comments.find_by(id: params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter,:body)
    end
end