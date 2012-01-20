require 'active_record'
require 'active_support'

module Filthy

  module ClassMethods

    def filthy_attributes(*args)
      class_variable_set(:@@filthy_attributes, args)
            
      class_variable_set(:@@filthy_attribute_methods, class_variable_get(:@@filthy_attributes).collect { |attribute| :"#{attribute}_filthy" })
      
      class_variable_get(:@@filthy_attribute_methods).each do |method|
        attr_accessor method
        
        send(:define_method, :"#{method}?") do
          !!send(method)
        end
      end
    end
  end

  module InstanceMethods
    
    def has_filthy_attributes?
      self.class.class_variables.include?("@@filthy_attributes")
    end
    
    def set_filthy_before_save
      clean_filthy_attributes
      filthy_attributes = changes.keys.select { |attribute| self.class.send(:class_variable_get, :@@filthy_attributes).include? attribute.to_sym }
      filthy_attributes.each do |filthy_attribute|
        send("#{filthy_attribute}_filthy=", true)
      end
    end

    def clean_filthy_attributes
      self.class.send(:class_variable_get, :@@filthy_attribute_methods).each { |fa| send("#{fa}=", nil) }
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
