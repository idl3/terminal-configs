base = "#{ENV['HOME']}/Projects"
if Dir.pwd.include?(base)
  unless base == Dir.pwd
    initial = 1
    directory = Dir.pwd.split("/")
    levels = directory.size
    nesting = 0
    levels.times do |i|
      nesting = i if File.exists?(directory[0..-(i+1)].join("/")+"/config.ru")
    end
    unless nesting == 0
      root = "../" * nesting
      if ARGV[0]
        if ARGV[0] == "routes"
          routes_path = root+"config/routes.rb"
          exec "vim #{routes_path}"
        elsif ARGV[0] == "gemfile"
          gemfiles_path = root+"/Gemfile"
          exec "vim #{gemfiles_path}"
        end
      else
        puts "Enter an argument bro .."
      end
    else
      exec "vim config/routes.rb"
    end
  else
    puts "You are at the projects directory"
  end
else
  puts "You can not run this outside of the projects directory"
end
