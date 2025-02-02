# frozen_string_literal: true

require 'erb'

class DotInstaller
  class << self
    def install!
      replace_all = false
      shell_scripts = Dir['*.sh']
      ruby_scripts = Dir['*.rb']
      json_files = Dir['*.json']
      markdown_files = Dir['*.md']
      hide_files = Dir['*.hide']
      ignore_these_files = [
        'duti',
        'ctags',
        'LICENSE',
        'dot_installer.rb',
      ]
      ignore_these_dirs = [
        'bin',
        'languages',
        'tmp',
      ]
      exclude_list = shell_scripts +
        ruby_scripts +
        json_files +
        markdown_files +
        hide_files +
        ignore_these_files +
        ignore_these_dirs

      Dir['*'].each do |file|
        next if exclude_list.include?(file)

        if replace_all
          replace_file(file)
        elsif File.exist?(File.join(ENV['HOME'], ".#{file.sub(".erb", "")}"))
          if File.identical?(file, File.join(ENV['HOME'], ".#{file.sub(".erb", "")}"))
            puts "identical ~/.#{file.sub(".erb", "")}"
          else
            print("overwrite ~/.#{file.sub(".erb", "")}? [ynaq] ")
            case $stdin.gets.chomp
            when 'a'
              replace_all = true
              replace_file(file)
            when 'y'
              replace_file(file)
            when 'q'
              exit
            else
              puts "skipping ~/.#{file.sub(".erb", "")}"
            end
          end
        else
          link_file(file)
        end
      end
    end

    def replace_file(file)
      puts "$HOME/.#{file.sub(".erb", "")}"
      system(%x{rm -rf "$HOME/.#{file.sub('.erb', '')}"})
      link_file(file)
    end

    def link_file(file)
      if /.erb$/.match?(file)
        puts "generating ~/.#{file.sub(".erb", "")}"
        File.open(File.join(ENV['HOME'], ".#{file.sub(".erb", "")}"), 'w') do |new_file|
          new_file.write(ERB.new(File.read(file)).result(binding))
        end
      else
        puts "linking ~/.#{file}"
        system(%{ln -s "$PWD/#{file}" "$HOME/.#{file}"})
      end
    end
  end
end
