class CreateCubeExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'cube' unless extension_enabled?('cube')
  end
end
