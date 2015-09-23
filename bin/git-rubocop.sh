#!/usr/bin/env ruby
# Improved from https://gist.github.com/mpeteuil/6147292
require 'english'
require 'rubocop'

VALID_FILE_EXT = %w(.rb .rabl .rake)
ADDED_OR_MODIFIED = /^\s*(A|AM|M)/.freeze

class NotInRepository < StandardError; end

def get_repository(path = Dir.pwd)
  ascender = Pathname.new(path).to_enum(:ascend)
  repo_path = ascender.detect { |dir| (dir + '.git').exist? }
  raise NotInRepository if repo_path.nil?
  repo_path.to_s
rescue NotInRepository
  puts "You must be within a Git repository to run this command."
  exit 0
end

Dir.chdir(get_repository) do
  changed_files = `git status --porcelain`.split(/\n/).
    select { |file_name_with_status|
      file_name_with_status =~ ADDED_OR_MODIFIED
    }.
    map { |file_name_with_status|
      file_name_with_status.split(' ')[1]
    }.
    select { |file_name|
      VALID_FILE_EXT.include? File.extname(file_name)
    }.join(' ')
  system("set -x; rubocop --config .rubocop.yml #{changed_files}; set +x") unless changed_files.empty?
end

exit $CHILD_STATUS.to_s[-1].to_i