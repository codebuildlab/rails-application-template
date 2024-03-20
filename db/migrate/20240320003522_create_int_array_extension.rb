class CreateIntArrayExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension "intarray" unless extension_enabled?('intarray')
  end
end
