class CommentsController < ApplicationController

    def create
        @review = Review.find(params[:review_id])
        @comment = @review.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to review_path(@review)
    end

    def destroy
        @review = Review.find(params[:review_id])
        @comment = @review.comments.find(params[:id])
        @comment.destroy
        redirect_to review_path(@review)
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :description)
    end

end
