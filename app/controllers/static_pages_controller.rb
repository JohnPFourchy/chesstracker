class StaticPagesController < ApplicationController
    before_action :authenticate_user!, only: :dashboard

    def home
        render :home
    end

    def dashboard
        @all_data = get_all_user_game_data()
        @white_data = get_all_white_game_data()
        @black_data = get_all_black_game_data()
        render :dashboard
    end

    private

    # get percentage data for all games, games as white, games as black
    def get_all_user_game_data
        all_data = Hash.new

        total_games = current_user.games.count
        all_data[:total_games] = total_games
        all_data[:total_won] = current_user.games.where("outcome = 'Won'").count
        all_data[:total_lost] = current_user.games.where("outcome = 'Lost'").count
        all_data[:total_drawn] = current_user.games.where("outcome = 'Draw'").count

        all_data[:total_tactic] = (current_user.games.where("tactic = true").count / total_games.to_f) * 100
        all_data[:total_time_management] = (current_user.games.where("time_management = true").count / total_games.to_f) * 100
        all_data[:total_opening_position] = (current_user.games.where("opening_position = true").count / total_games.to_f) * 100
        all_data[:total_middlegame_position] = (current_user.games.where("middlegame_position = true").count / total_games.to_f) * 100
        all_data[:total_endgame_position] = (current_user.games.where("endgame_position = true").count / total_games.to_f) * 100
        all_data[:total_give_up] = (current_user.games.where("give_up = true").count / total_games.to_f) * 100
        all_data[:total_blunder] = (current_user.games.where("blunder = true").count / total_games.to_f) * 100

        return all_data
    end

    def get_all_white_game_data
        white_data = Hash.new

        total_games = current_user.games.where("color = 'White'").count
        white_data[:total_games] = total_games
        white_data[:total_won] = current_user.games.where("outcome = 'Won'").where("color = 'White'").count
        white_data[:total_lost] = current_user.games.where("outcome = 'Lost'").where("color = 'White'").count
        white_data[:total_drawn] = current_user.games.where("outcome = 'Draw'").where("color = 'White'").count

        white_data[:total_tactic] = (current_user.games.where("tactic = true").where("color = 'White'").count / total_games.to_f) * 100
        white_data[:total_time_management] = (current_user.games.where("time_management = true").where("color = 'White'").count / total_games.to_f) * 100
        white_data[:total_opening_position] = (current_user.games.where("opening_position = true").where("color = 'White'").count / total_games.to_f) * 100
        white_data[:total_middlegame_position] = (current_user.games.where("middlegame_position = true").where("color = 'White'").count / total_games.to_f) * 100
        white_data[:total_endgame_position] = (current_user.games.where("endgame_position = true").where("color = 'White'").count / total_games.to_f) * 100
        white_data[:total_give_up] = (current_user.games.where("give_up = true").where("color = 'White'").count / total_games.to_f) * 100
        white_data[:total_blunder] = (current_user.games.where("blunder = true").where("color = 'White'").count / total_games.to_f) * 100

        return white_data
    end

    def get_all_black_game_data
        black_data = Hash.new

        total_games = current_user.games.where("color = 'Black'").count
        black_data[:total_games] = total_games
        black_data[:total_won] = current_user.games.where("outcome = 'Won'").where("color = 'Black'").count
        black_data[:total_lost] = current_user.games.where("outcome = 'Lost'").where("color = 'Black'").count
        black_data[:total_drawn] = current_user.games.where("outcome = 'Draw'").where("color = 'Black'").count

        black_data[:total_tactic] = (current_user.games.where("tactic = true").where("color = 'Black'").count / total_games.to_f) * 100
        black_data[:total_time_management] = (current_user.games.where("time_management = true").where("color = 'Black'").count / total_games.to_f) * 100
        black_data[:total_opening_position] = (current_user.games.where("opening_position = true").where("color = 'Black'").count / total_games.to_f) * 100
        black_data[:total_middlegame_position] = (current_user.games.where("middlegame_position = true").where("color = 'Black'").count / total_games.to_f) * 100
        black_data[:total_endgame_position] = (current_user.games.where("endgame_position = true").where("color = 'Black'").count / total_games.to_f) * 100
        black_data[:total_give_up] = (current_user.games.where("give_up = true").where("color = 'Black'").count / total_games.to_f) * 100
        black_data[:total_blunder] = (current_user.games.where("blunder = true").where("color = 'Black'").count / total_games.to_f) * 100

        return black_data
    end
end
