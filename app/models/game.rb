class Game < ActiveRecord::Base
  attr_accessible :logo1x, :logo2x, :logo4x, :logo1x_tr, :logo2x_tr, :logo4x_tr, :title, :version, :app_name, :description_tr, :description_en

  has_attached_file :logo1x,
                    :storage => ENV['S3_BUCKET_NAME'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
  has_attached_file :logo2x,
                    :storage => ENV['S3_BUCKET_NAME'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
  has_attached_file :logo4x,
                    :storage => ENV['S3_BUCKET_NAME'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }                    
  has_attached_file :logo1x_tr,
                    :storage => ENV['S3_BUCKET_NAME'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
  has_attached_file :logo2x_tr,
                    :storage => ENV['S3_BUCKET_NAME'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
  has_attached_file :logo4x_tr,
                    :storage => ENV['S3_BUCKET_NAME'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
end
