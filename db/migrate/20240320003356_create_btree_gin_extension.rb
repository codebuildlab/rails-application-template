class CreateBtreeGinExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension "btree_gin" unless extension_enabled?('btree_gin')
  end
end
