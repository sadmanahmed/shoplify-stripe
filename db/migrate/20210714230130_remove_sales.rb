class RemoveSales < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :sales_count
  end
end
