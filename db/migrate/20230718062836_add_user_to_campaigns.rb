class AddUserToCampaigns < ActiveRecord::Migration[7.0]
  def change
    add_reference :campaigns, :user, null: false, foreign_key: true
  end
end