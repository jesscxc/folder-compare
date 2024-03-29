#!/usr/bin/env ruby

require 'fileutils'
require 'digest/md5'

# 2013-04-24
# Jesse Cummins
# https://github.com/jessc

=begin
# Bug List / TODO:

=end


class FolderCompare
  def initialize(folder_paths)
    @file_list = []
    folder_paths.each do |path|
      if path.end_with? "/" then path += "**/*"
      else path += "/**/*"
      end
      @file_list << Dir.glob(path)
    end
    @file_list.flatten!
  end

  def compare
    all_files = {}

    @file_list.each do |file|
      mod_time = File.new(file).mtime.to_s
      size = File.new(file).size.to_s
      digest = Digest::MD5.hexdigest(mod_time + size)

      unless all_files.include? digest
        all_files[digest] = [file]
      else
        all_files[digest] << file
      end
    end

    s = ""
    all_files.each do |k, v|
      if v.length > 1
        v.each { |file_name| s += file_name + "\n" }
        s += "\n"
      end
    end

    return s + "Did something!"
  end
end


folder_paths = []
unless ARGV.empty?
  ARGV.each { |path| folder_paths << path }
else folder_paths << Dir.pwd
end

puts FolderCompare.new(folder_paths).compare

