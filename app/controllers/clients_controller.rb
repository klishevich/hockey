class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
    respond_to do |format|  
      format.html
      # format.json  { render :json => @client.to_json(:include => {:events})}
      format.json  { render :json => @client, :include => :events}
    end
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
