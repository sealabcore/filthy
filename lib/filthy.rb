module Filthy

  module ClassMethods

    def filthy_attributes(*args)
      @@filthy_attributes = args

      @@filthy_attribute_symbol_array = @@filty_attributes.collect { |attribute| :"#{attribute}_filthy" }

      attr_accessor @@filthy_attribute_symbol_array
    end

  end

  module InstanceMethods

    def set_filty_before_save
      showerand_and_scrub_filthy_attributes
      filthy_attributes = changes.keys.select { |attribute| @@filthy_attributes.include? attribute.to_s }
      filthy_attributes.each do |fa|
        send("#{fa.to_s}_filthy=", true)
      end
    end

    def showerand_and_scrub_filthy_attributes
      @@filthy_attribute_symbol_array.each { |fa| send("#{fa}_filthy=", nil) }
    end

  end

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
    base.before_save :set_filty_before_save
  end

end

class ActiveRecord::Base
  include Filthy
end
