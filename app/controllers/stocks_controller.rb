class StocksController < ApplicationController

    protect_from_forgery except: :search

    def search
        if params[:stock].present?
          @stock = Stock.new_lookup(params[:stock])
          if @stock
            render 'users/my_portfolio'

            # respond_to do |format|
            #     format.js { render partial: 'users/result1' }
            # end
          else
            respond_to do |format|
                flash.now[:alert] = "Please enter a valid symbol to search"
                format.js { render partial: 'users/result1' }
            end
            # redirect_to my_portfolio_path
          end    
        else
            respond_to do |format|
                flash.now[:alert] = "Please enter a symbol to search"
                format.js { render partial: 'users/result1' }
            end
        #   redirect_to my_portfolio_path
        end
      end

end