class GroupDetailsController < ApplicationController
  # GET /group_details
  # GET /group_details.xml
  def index
    @group_details = GroupDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_details }
    end
  end

  # GET /group_details/1
  # GET /group_details/1.xml
  def show
    @group_detail = GroupDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_detail }
    end
  end

  # GET /group_details/new
  # GET /group_details/new.xml
  def new
    @group_detail = GroupDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_detail }
    end
  end

  # GET /group_details/1/edit
  def edit
    @group_detail = GroupDetail.find(params[:id])
  end

  # POST /group_details
  # POST /group_details.xml
  def create
    @group_detail = GroupDetail.new(params[:group_detail])

    respond_to do |format|
      if @group_detail.save
        flash[:notice] = 'GroupDetail was successfully created.'
        format.html { redirect_to(@group_detail) }
        format.xml  { render :xml => @group_detail, :status => :created, :location => @group_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_details/1
  # PUT /group_details/1.xml
  def update
    @group_detail = GroupDetail.find(params[:id])

    respond_to do |format|
      if @group_detail.update_attributes(params[:group_detail])
        flash[:notice] = 'GroupDetail was successfully updated.'
        format.html { redirect_to(@group_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_details/1
  # DELETE /group_details/1.xml
  def destroy
    @group_detail = GroupDetail.find(params[:id])
    @group_detail.destroy

    respond_to do |format|
      format.html { redirect_to(group_details_url) }
      format.xml  { head :ok }
    end
  end
end
