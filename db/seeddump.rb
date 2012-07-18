u = User.all
u.each do |user|
  puts "User.create(:login => '#{user.login}', :password => '#{user.password}')"
end