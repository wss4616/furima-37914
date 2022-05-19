class CreateDeliveryChargeBearers < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_charge_bearers do |t|

      t.timestamps
    end
  end
end
