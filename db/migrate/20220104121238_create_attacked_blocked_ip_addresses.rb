class CreateAttackedBlockedIpAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :attacked_blocked_ip_addresses do |t|
      t.string :ip_address
      t.timestamps
    end
  end
end
