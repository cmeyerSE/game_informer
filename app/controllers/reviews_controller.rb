class ReviewsController < ApplicationController
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
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])

        if @review.update(review_params)
            redirect_to @review
        else
            render 'edit'
        end
    end

    def edit
        @review = Review.find(params[:id])
    end


    private

    def review_params
        params.require(:review).permit(:title, :content)
    end
end
