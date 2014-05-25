module Api
  module V1
    class ClientsController < ApplicationController

      respond_to :json

      def index
        inn = params[:inn]
        kpp = params[:kpp]
        @clients = kpp.blank? ? Client.where(["inn = ?", inn]) 
                              : Client.where(["inn = ? and kpp = ?", inn, kpp])
        # @clients = Client.all
        # respond_to do |format|
        #   format.json {@clients = kpp.blank? ? Client.where(["inn = ?", inn]) 
        #                     : Client.where(["inn = ? and kpp = ?", inn, kpp])}
        #   format.html {@clients ||= Client.all}
        # end
        respond_with @clients
      end

      def show
        @client = Client.find(params[:id])
        @events = @client.events
        # respond_to do |format|  
        #   format.html
        #   format.json  { render :json => @client, :include => :events}
        # end
      end

      def new
        @client = Client.new
      end

      def edit
        @client = Client.find(params[:id])
      end

      def create
        @client = Client.new(params[:client])

    	  if @client.save
    	    redirect_to @client, notice: 'client was successfully created.'
    	  else
    	    render action: "new"
    	  end
      end

      def update
        @client = Client.find(params[:id])

        if @client.update_attributes(params[:client])
          redirect_to @client, notice: 'client was successfully updated.'
        else
          render action: "edit"
        end
      end

      def destroy
        @client = Client.find(params[:id])
        @client.destroy

        redirect_to clients_url
      end
    end
  end
end