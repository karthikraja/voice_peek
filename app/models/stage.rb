class Stage < ActiveRecord::Base

  belongs_to :user

  has_attachment :content_type => 'application/.3gp',
    :path_prefix => 'public/swf',
    :storage => :file_system
                     

   def after_save
  #    spawn do
  #      command = <<-end_command
  #   system("public/ffmpeg/ffmpeg.exe -i #{ RAILS_ROOT+'/public' + public_filename} -ar 22050 -ab 32 -s 480x360 -acodec libmp3lame -vcodec flv -r 25 -qscale 8 -b 25000000 -acodec libmp3lame -f flv -y #{ RAILS_ROOT+'/public' + public_filename + '.flv' }")
  #      end_command
  #      logger.debug "Converting video...command: " + command
  #    end

      @file= '/public'+public_filename
    @target_file=@file.gsub('.3gp','.flv')
    @location=@target_file.gsub('/public/swf/','')
    @location.to_s.strip
    logger.debug "currently trying to convert the video ( #{@file} ) path ( #{@file}) from content type of #{@target_file} to flv"
    #    #system("ffmpeg.exe -i #{RAILS_ROOT + @file} -ar 44100  -ac 1 -vol 1024 -ab 256 -s 480x360 -acodec libmp3lame -vcodec flv -r 25 -qscale 8 -b 25000000 -acodec libmp3lame -f flv -y #{ RAILS_ROOT+@target_file }")
    system("ffmpeg -i #{RAILS_ROOT + @file} -ar 44100  -ac 1 -vol 1024 -ab 535 -acodec libmp3lame -vcodec flv -r 25 -qscale 8 -b 25000 -acodec libmp3lame -f flv -y #{ RAILS_ROOT+@target_file }")
    end

 
  end

