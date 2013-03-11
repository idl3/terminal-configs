if ARGV[0]
  puts "Cloning into Github #{ARGV[0]}"
  if ARGV[1] and ARGV[1].include?("branch:")
    exec "git clone git://github.com/#{ARGV[0]}.git -b #{ARGV[1][7..-1]} #{ARGV[2] if ARGV[2]}"
  else
    exec "git clone git://github.com/#{ARGV[0]}.git #{ARGV[1] if ARGV[1]}"
  end
else
  puts "Error: You must supply a Git Repository"
end
