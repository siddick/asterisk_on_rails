class PbxDetailsController < ApplicationController
  # GET /pbx_details
  # GET /pbx_details.xml
  def index
    @pbx_details = PbxDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pbx_details }
    end
  end

  # GET /pbx_details/1
  # GET /pbx_details/1.xml
  def show
    @pbx_detail = PbxDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pbx_detail }
    end
  end

  # GET /pbx_details/new
  # GET /pbx_details/new.xml
  def new
    @pbx_detail = PbxDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pbx_detail }
    end
  end

  # GET /pbx_details/1/edit
  def edit
    @pbx_detail = PbxDetail.find(params[:id])
  end

  # POST /pbx_details
  # POST /pbx_details.xml
  def create
    @pbx_detail = PbxDetail.new(params[:pbx_detail])

    respond_to do |format|
      if @pbx_detail.save
        flash[:notice] = 'PbxDetail was successfully created.'
        format.html { redirect_to(@pbx_detail) }
        format.xml  { render :xml => @pbx_detail, :status => :created, :location => @pbx_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pbx_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pbx_details/1
  # PUT /pbx_details/1.xml
  def update
    @pbx_detail = PbxDetail.find(params[:id])

    respond_to do |format|
      if @pbx_detail.update_attributes(params[:pbx_detail])
        flash[:notice] = 'PbxDetail was successfully updated.'
        format.html { redirect_to(@pbx_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pbx_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pbx_details/1
  # DELETE /pbx_details/1.xml
  def destroy
    @pbx_detail = PbxDetail.find(params[:id])
    @pbx_detail.destroy

    respond_to do |format|
      format.html { redirect_to(pbx_details_url) }
      format.xml  { head :ok }
    end
  end
end
