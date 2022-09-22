class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :update, :edit, :destroy]

    def index
        @reviews = Review.all.order("created_at DESC")
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)

        if @review.save
            redirect_to @review
        else
            render 'new'
        end
    end

    def show
    end

    def update
        if @review.update(review_params)
            redirect_to @review
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        @review.destroy

        redirect_to reviews_path
    end


    private

    def review_params
        params.require(:review).permit(:title, :content)
    end

    def find_review
        @review = Review.find(params[:id])
    end
end
