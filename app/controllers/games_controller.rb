class GamesController < ApplicationController
    before_action :authenticate_user!

    def index
        @games = current_user.games.all
    end

    def show
        @game = current_user.games.find(params[:id])
    end

    def new
        @game = current_user.games.build
    end

    def create
        @game = current_user.games.create!(game_params)

        if @game.save!
            redirect_to games_url
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @game = current_user.games.find(params[:id])
    end

    def update
        @game = current_user.games.find(params[:id])

        if @game.update!(game_params)
            redirect_to @game
        else
            render :edit, status: :unprocessable_entity
        end

    end

    def destroy
        @game = current_user.games.find(params[:id])
        @game.destroy

        redirect_to games_url, status: :see_other
    end

    private
    def game_params
        params.require(:game).permit(:url, :date_played, :time_control, :color, :outcome, :time_management, :tactic, :opening_position, :middlegame_position, :endgame_position, :blunder, :give_up, :notes, :user_id)
    end

end