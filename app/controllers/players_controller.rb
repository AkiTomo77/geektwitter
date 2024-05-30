class PlayersController < ApplicationController
    def index
        @players = Player.all
        @coordinates = Coordinate.all
      end
    
      def coorde
        @player = Player.find(params[:player_id])
        @coordinate = Coordinate.find(params[:coordinate_id])
        @player.coordinates << @coordinate
        redirect_to player_path(@player), notice: "装備を適用しました。"
      end
    
      def show
        @player = Player.find(params[:id])
        @total_stats = @player.total_stats
      end
end
