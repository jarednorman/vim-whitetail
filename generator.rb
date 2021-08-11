#!/usr/bin/env ruby

require "erb"

$:.unshift File.join(
  File.dirname(__FILE__),
  "src"
)

require "theme"

erb = ERB.new(
  File.read("./template.erb")
)

theme = Theme.new

File.write(
  "./colors/whitetail.vim",
  erb.result(binding)
)
