class CreateHStoreExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension "hstore" unless extension_enabled?('hstore')
  end
end
