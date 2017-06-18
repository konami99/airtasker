class CreateRequestIps < ActiveRecord::Migration[5.1]
  def change
    create_table :request_ips do |t|
      t.string :source
      t.bigint :ip_address
      t.datetime :started_at
      t.integer :count

      t.timestamps

      t.index :source
      t.index :ip_address
      t.index :started_at
    end
  end
end
