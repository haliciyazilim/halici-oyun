
namespace :win_count do
  desc 'Calculate win_count for all users'
  task :calculate => :environment do
    DimUser.all.each do |user|
      user.win_count = DimMatch.where(:winner_id => user.gc_id).where("created_at > ?", "2013-10-16 00:00:00").count
      user.save!
    end
  end
end
