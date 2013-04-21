#!/usr/bin/env ruby

require 'fileutils'
require 'digest/md5'

# 2013-04-20
# Jesse Cummins: https://github.com/jessc


folder_paths = []
ARGV.each do |path|
  folder_paths << path
end


file_list = []
folder_paths.each do |path|
  if path.end_with? "/" then path += "**/*"
  else path += "/**/*"
  end
  file_list << Dir.glob(path)
end
file_list.flatten!


all_files = {}

file_list.each do |file|
  mod_time = File.new(file).mtime.to_s
  size = File.new(file).size.to_s
  digest = Digest::MD5.hexdigest(mod_time + size)

  unless all_files.include? digest
    all_files[digest] = [file]
  else
    all_files[digest] << file
  end
end

all_files.each do |k, v|
  if v.length > 1
    v.each { |file_name| puts file_name }
    puts
  end
end

puts "Did something!"
