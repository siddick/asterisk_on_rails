class ConfigFilesController < ApplicationController
  # GET /config_files
  # GET /config_files.xml
  def index
    @config_files = ConfigFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @config_files }
    end
  end

  # GET /config_files/1
  # GET /config_files/1.xml
  def show
    @config_file = ConfigFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @config_file }
    end
  end

  # GET /config_files/new
  # GET /config_files/new.xml
  def new
    @config_file = ConfigFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @config_file }
    end
  end

  # GET /config_files/1/edit
  def edit
    @config_file = ConfigFile.find(params[:id])
  end

  # POST /config_files
  # POST /config_files.xml
  def create
    @config_file = ConfigFile.new(params[:config_file])

    respond_to do |format|
      if @config_file.save
        flash[:notice] = 'ConfigFile was successfully created.'
        format.html { redirect_to(@config_file) }
        format.xml  { render :xml => @config_file, :status => :created, :location => @config_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @config_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /config_files/1
  # PUT /config_files/1.xml
  def update
    @config_file = ConfigFile.find(params[:id])

    respond_to do |format|
      if @config_file.update_attributes(params[:config_file])
        flash[:notice] = 'ConfigFile was successfully updated.'
        format.html { redirect_to(@config_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @config_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /config_files/1
  # DELETE /config_files/1.xml
  def destroy
    @config_file = ConfigFile.find(params[:id])
    @config_file.destroy

    respond_to do |format|
      format.html { redirect_to(config_files_url) }
      format.xml  { head :ok }
    end
  end
end
