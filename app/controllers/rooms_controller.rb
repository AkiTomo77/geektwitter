class RoomsController < ApplicationController
	before_action :authenticate_user!
	def create
		@room = Room.create
		
end
