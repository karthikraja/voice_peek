class StageController < ApplicationController

	protect_from_forgery :only => [:create, :update, :destroy]

  def new
    @stage = Stage.new
    @user=User.find(:all)
  end

  def create
    #@user=User.find(:all, :conditions => {:id => params[:id]}, :order => 'created_at DESC')
    @stage = Stage.new(params[:stage])
    @stage.user_id=session[:user_id]
    
    if @stage.save
      flash[:notice] = 'File was successfully created.'
      redirect_to :action=>'index',:id=>session[:user_id]
    else
      flash[:notice] = 'File was unsuccessfully created.'
      render :action => :new
    end
  end

  def index
    @stages = Stage.find(:all, :conditions => {:user_id => session[:user_id]}, :order => 'created_at DESC')
    @user_id=params[:id]
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @stages.to_xml }
    end

  end

  def show
      @stages = Stage.find(:all, :conditions => {:user_id => session[:user_id]}, :order => 'created_at DESC')
      @file= '/public'+params[:file]
      @target_file=@file.gsub('.3gp','.flv')
      @location=@target_file.gsub('/public/swf/','')
      @location.to_s.strip
      @filename=params[:name]
      logger.debug "currently trying to convert the video ( #{@file} ) path ( #{RAILS_ROOT}) from content type of #{@target_file} to flv"
      system("ffmpeg -i #{RAILS_ROOT + @file} -ar 44100  -ac 2 -vol 1024 -ab 64 -s 480x360 -acodec libmp3lame -vcodec flv -r 25 -qscale 8 -b 25000000 -acodec libmp3lame -f flv -y #{ RAILS_ROOT+@target_file }")
  end
  
  def upload
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      flash[:notice] = "Logged in successfully"

      @stage = Stage.new(params[:stage])
    @stage.user_id=session[:user_id]

    @stage.save!
      ##post = DataFile.save(params[:uploaded_data])
      File.open('public/upload/test.3gp', 'wb') { |f| f.write(params[:stage][:uploaded_data].read) }
	  #FileUtils.mv params[:stage][:uploaded_data].path, 'public/upload/test.3gp'

      redirect_to :controller => 'stage', :action => 'index', :id=>self.current_user.id
    else
      flash[:notice] = "Username and Password are not valid"
      redirect_to  :controller=>'sessions', :action=>'new'
    end
    
  end



end
