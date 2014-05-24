class EventsController < ApplicationController
	def index
	    @client=Client.find(params[:client_id])
	    @events = @client.events   
	end		

	def create
		@client=Client.find(params[:client_id])
		@event = @client.events.new(params[:event])
		@event.save
		respond_to do |format|
	      format.html { redirect_to client_path(@client), notice: t(:event_was_successfully_created)}
	      format.js
	    end		
	end

	def show
		@client=Client.find(params[:client_id])
		@event = @client.events.find(params[:event_id])
	end

	def destroy
		@client=Client.find(params[:client_id])
		@event=@client.events.find(params[:id])
		@event.destroy
		respond_to do |format|
	      format.html { redirect_to client_path(@client) }
	      format.js
	    end
	end

end
