class UploadController < ApplicationController
  def index
     render :file => 'app\views\upload\uploadfile.erb'
  end
  def uploadfile
    post = DataFile.file( params[:upload],'12')
    render :text => "File has been uploaded successfully"
  end

  def show
    logger.debug "..#{RAILS_ROOT}"
    #logger.debug "currently trying to convert the video ( #{self.filename} ) path ( #{self.full_filename}) from content type of #{self.content_type} to flv"
    # system "ffmpeg -i #{full_filename} -ar 22050 -ab 32 -y -f flv -s 320x240 #{full_filename}.flv"
    system("ffmpeg.exe -i #{RAILS_ROOT + '/public/swf/0000/0003/downlink-phonespeaker.3gp'} -ar 22050 -ab 32 -s 480x360 -acodec libmp3lame -vcodec flv -r 25 -qscale 8 -b 25000000 -acodec libmp3lame -f flv -y #{ RAILS_ROOT + '/public/swf/upload/downlink123.flv' }")
    #"ffmpeg -i #{full_filename} -r 25 -acodec mp3 -ar 22050 -y -s 320x240 #{full_filename}.flv"
    # system "flvtool2 -U #{full_filename}"
  end

 
end
