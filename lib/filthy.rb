require 'active_record'
require 'active_support'

module Filthy

  module ClassMethods

    def filthy_attributes(*args)
      raise ArgumentError if args.empty?
      class_inheritable_accessor :filthy_columns, :filthy_attribute_methods
      self.filthy_columns = args
      self.filthy_attribute_methods = self.filthy_columns.collect { |attribute| :"#{attribute}_filthy" }
      
      self.filthy_attribute_methods.each do |method|
        attr_accessor method
        
        send(:define_method, :"#{method}?") do
          !!send(method)
        end
      end
    end
  end

  module InstanceMethods
    
    def has_filthy_attributes?
      defined?(filthy_columns) and self.filthy_columns.present?
    end
    
    def set_filthy_before_save
      clean_filthy_attributes
      filthy_attributes = changes.keys.select { |attribute| self.class.filthy_columns.include? attribute.to_sym }
      filthy_attributes.each do |filthy_attribute|
        send("#{filthy_attribute}_filthy=", true)
      end
    end

    def clean_filthy_attributes
      self.class.filthy_attribute_methods.each { |fa| send("#{fa}=", nil) }
    end

  end

  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
    base.before_save :set_filthy_before_save, :if => Proc.new { |object| object.has_filthy_attributes? }
  end
  
end

class ActiveRecord::Base
  include Filthy
end
