class CommentsController < ApplicationController

    def create
        @article = set_article
        @comment = @article.comments.create(comment_params)
        if @comment.save
            redirect_to article_path(@article), notice: "Comment saved!"
        else
            redirect_to article_path(@article), alert: "Comment could not be saved."
        end
    end

    def destroy
        @article = set_article
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), info: "Comment destroyed."
    end

    private
        def set_article
            return Article.find(params[:article_id])
        end

        def comment_params
            params.require(:comment).permit(:author, :body)
        end
end