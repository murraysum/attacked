class CreateAttackedBlockedIpAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :attacked_blocked_ip_addresses do |t|
      t.string :ip_address, index: { unique: true }
      t.text :description
      t.timestamps
    end
  end
end
