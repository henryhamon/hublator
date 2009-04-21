class Ore < ActiveRecord::Base


#  before_save :clean_url

#  def clean_url
#    unless self.url =~ /https?:\/\/.*/
#      write_attribute :url, "http://" + self.url.to_s
#    else
#      write_attribute :url, self.url
#    end
#  end
  
  def url=(value)
    unless value =~ /https?:\/\/.*/
       write_attribute :url, "http://" + value.to_s
    else
       write_attribute :url, value
    end
  end 


end
