class StaticPagesController < ApplicationController
  def page1
  end

  def page2
    @newzip = ZipCode.new(params[:zip]) unless params[:zip].blank?

    # start_default = Date.civil(2010,1,1)
    # end_default  = Date.civil(2015,1,1)
    # @date_reg_s=Date.civil(params[:sdate_reg_s][:year].to_i,params[:sdate_reg_s][:month].to_i,params[:sdate_reg_s][:day].to_i) rescue start_default
    # @date_reg_po=Date.civil(params[:sdate_reg_po][:year].to_i,params[:sdate_reg_po][:month].to_i,params[:sdate_reg_po][:day].to_i) rescue end_default
    # @placing_date_s=Date.civil(params[:splacing_date_s][:year].to_i,params[:splacing_date_s][:month].to_i,params[:splacing_date_s][:day].to_i) rescue start_default
    # @placing_date_po=Date.civil(params[:splacing_date_po][:year].to_i,params[:splacing_date_po][:month].to_i,params[:splacing_date_po][:day].to_i) rescue end_default
    # @tenders = Tender.search(params[:sname], params[:sreg_num], params[:scustomer], params[:stender_type],
    # params[:stender_state],params[:sprice_s],params[:sprice_do],@date_reg_s,@date_reg_po,@placing_date_s,@placing_date_po)
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @tenders }
    # end  	
  end

  def page3
  end
end
