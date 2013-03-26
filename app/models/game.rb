class Game < ActiveRecord::Base
  attr_accessible :logo, :logo2x, :name, :version, :appId, :description_tr, :description_en

  has_attached_file :logo,
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
  # has_attached_file :logo,
  #                   :storage => :s3,
  #                   :bucket => 'brainquire',
  #                   :s3_credentials => {
  #                     :access_key_id => "AKIAJSPLS2XSYYZ4G2IQ",
  #                     :secret_access_key => "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"
  #                   }  
                    
  has_attached_file :logo2x,
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
end
