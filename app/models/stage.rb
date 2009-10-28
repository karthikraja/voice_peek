class Stage < ActiveRecord::Base

  belongs_to :user

  has_attachment :content_type => 'application/.3gp',
    :path_prefix => 'public/swf',
    :storage => :file_system,
    :max_size => 10.megabytes,
    :size=>1.megabyte
                     

  #validates_as_attachment
  
#  def after_save
#    spawn do
#      command = <<-end_command
#   system("public/ffmpeg/ffmpeg.exe -i #{ RAILS_ROOT+'/public' + public_filename} -ar 22050 -ab 32 -s 480x360 -acodec libmp3lame -vcodec flv -r 25 -qscale 8 -b 25000000 -acodec libmp3lame -f flv -y #{ RAILS_ROOT+'/public' + public_filename + '.flv' }")
#      end_command
#      logger.debug "Converting video...command: " + command
#    end
#  end

 
  end

