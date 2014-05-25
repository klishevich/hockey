module Api
  module V1
    class ClientsController < ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      # curl  http://localhost:3000/api/clients?i408290560 -u 'admin:secret'
      before_filter :restrict_access
      respond_to :json

      def index
        inn = params[:inn]
        kpp = params[:kpp]
        @clients = kpp.blank? ? Client.where(["inn = ?", inn]) 
                              : Client.where(["inn = ? and kpp = ?", inn, kpp])
        # respond_with @clients
        render :json => @clients, :include => :events
      end

      def show
        @client = Client.find(params[:id])
        @events = @client.events
        render :json => @client, :include => :events
        # respond_to do |format|  
        #   format.html
        #   format.json  { render :json => @client, :include => :events}
        # end
      end

      # def new
      #   @client = Client.new
      # end

      # def edit
      #   @client = Client.find(params[:id])
      # end

      def create
       #  @client = Client.new(params[:client])

    	  # if @client.save
    	  #   redirect_to @client, notice: 'client was successfully created.'
    	  # else
    	  #   render action: "new"
    	  # end
        respond_with Client.create(params[:client])
      end

      def update
        # @client = Client.find(params[:id])

        # if @client.update_attributes(params[:client])
        #   redirect_to @client, notice: 'client was successfully updated.'
        # else
        #   render action: "edit"
        # end
        respond_with Client.update(params[:id], params[:client])
      end

      def destroy
        # @client = Client.find(params[:id])
        # @client.destroy

        # redirect_to clients_url
        respond_with Client.destroy(params[:id])
      end

      private
      # def restrict_access
      #   api_key = ApiKey.find_by_access_token(params[:access_token])
      #   head :unauthorized unless api_key
      # end
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
    end
  end
end