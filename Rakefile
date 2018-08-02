require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  shell_scripts = Dir['*.sh']
  ruby_scripts = Dir['*.rb']
  json_files = Dir['*.json']
  ignore_these_files = %w[
    duti
    LICENSE
    Rakefile
  ]
  ignore_these_dirs = %w[
    bin
    languages
  ]
  exclude_list = shell_scripts +
    ruby_scripts +
    json_files +
    ignore_these_files +
    ignore_these_dirs

  Dir['*'].each do |file|
    next if exclude_list.include? file

    if replace_all
      replace_file(file)
    else
      if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
        if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
          puts "identical ~/.#{file.sub('.erb', '')}"
        else
          print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
          case $stdin.gets.chomp
          when 'a'
            replace_all = true
            replace_file(file)
          when 'y'
            replace_file(file)
          when 'q'
            exit
          else
            puts "skipping ~/.#{file.sub('.erb', '')}"
          end
        end
      else
        link_file(file)
      end
    end
  end
end

def replace_file(file)
  puts "$HOME/.#{file.sub('.erb', '')}"
  system %x{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
