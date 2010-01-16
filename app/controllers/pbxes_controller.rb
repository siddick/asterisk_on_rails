class PbxesController < ApplicationController
  # GET /pbxes
  # GET /pbxes.xml
  def index
    @pbxes = Pbx.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pbxes }
    end
  end

  # GET /pbxes/1
  # GET /pbxes/1.xml
  def show
    @pbx = Pbx.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pbx }
    end
  end

  # GET /pbxes/new
  # GET /pbxes/new.xml
  def new
    @pbx = Pbx.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pbx }
    end
  end

  # GET /pbxes/1/edit
  def edit
    @pbx = Pbx.find(params[:id])
  end

  # POST /pbxes
  # POST /pbxes.xml
  def create
    @pbx = Pbx.new(params[:pbx])

    respond_to do |format|
      if @pbx.save
        flash[:notice] = 'Pbx was successfully created.'
        format.html { redirect_to(@pbx) }
        format.xml  { render :xml => @pbx, :status => :created, :location => @pbx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pbx.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pbxes/1
  # PUT /pbxes/1.xml
  def update
    @pbx = Pbx.find(params[:id])

    respond_to do |format|
      if @pbx.update_attributes(params[:pbx])
        flash[:notice] = 'Pbx was successfully updated.'
        format.html { redirect_to(@pbx) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pbx.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pbxes/1
  # DELETE /pbxes/1.xml
  def destroy
    @pbx = Pbx.find(params[:id])
    @pbx.destroy

    respond_to do |format|
      format.html { redirect_to(pbxes_url) }
      format.xml  { head :ok }
    end
  end
end
