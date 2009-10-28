class DataFile < ActiveRecord::Base
  def self.save(upload,id)
    name =  upload['datafile'].original_filename
    directory = "upload/public/data/"+id
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
  

end
