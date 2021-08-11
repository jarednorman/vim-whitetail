#!/usr/bin/env ruby

require "erb"

erb = ERB.new(
  File.read("./template.erb")
)

File.write(
  "./colors/whitetail.vim",
  erb.result(binding)
)
