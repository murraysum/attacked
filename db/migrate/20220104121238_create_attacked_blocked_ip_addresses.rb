class CreateAttackedBlockedIpAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :attacked_blocked_ip_addresses do |t|
      t.string :ip_address, index: { unique: true, name: "idx_attacked_blocked_ip_on_ip" }
      t.text :description
      t.timestamps
    end
  end
end
