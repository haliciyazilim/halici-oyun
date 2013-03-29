class Game < ActiveRecord::Base
  attr_accessible :logo, :logo2x, :logo1x, :name, :version, :appId, :description_tr, :description_en

  has_attached_file :logo,
                    :storage => ENV['S3_BUCKET'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
  has_attached_file :logo1x,
                    :storage => ENV['S3_BUCKET'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }                    
  has_attached_file :logo2x,
                    :storage => ENV['S3_BUCKET'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
end
