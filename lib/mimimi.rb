require 'ostruct'
require 'yaml'
require 'erb'

module Mimimi

  extend self


  def self.[]=(k, v)
    self.send(:attr_accessor, k) if !self.respond_to?(k)
    self.send("#{k}=", v)
  end


  def env
    Rails.env
  end


  def root
    Rails.root.to_s
  end


  def self.yap!(path = nil)
    path ||= root
    Dir[path + '/config/**/*.yml'].each do |f|
      res = YAML::load(ERB.new(IO.read(f)).result)
      cfg = res[env.to_s] if res != false
      next if cfg.nil?
      self[File.basename(f, '.yml')] = OpenStruct.new(cfg)
    end
  end


  def self.method_missing(m, *args) nil ; end

end
