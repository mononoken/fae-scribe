require "rails_helper"

RSpec.describe "collections", type: :system do
  #   context "when other user joins the collection" do
  #     # let!(:other_user) { create(:user) }
  #     # let!(:other_journal) { create(:journal, author: other_user) }
  #     # let!(:other_note) { create(:note, journal: other_journal, author: other_user) }
  #
  #     before do
  #       # click_button "invite-user-btn"
  #       # select other_user.name, from: "invites-select"
  #       # sign_in other_user
  #       # visit dashboard_path
  #       #
  #       # within "notifications-list" do
  #       #   click_button "accept-collection-btn"
  #       # end
  #     end
  #
  #     it "shows notes of other's in the collection" do
  #       pending "Implement accepting collection invitations"
  #       # click_link "collection-link"
  #       # expect(page).to have_content(other_note.name)
  #     end
  #   end
  # end
  #
  # xcontext "when user has joined a collection" do
  #   # let!(:user_journal) { create(:journal, author: user) }
  #   #
  #   # let!(:other_user1) { create(:user) }
  #   # let!(:other_user2) { create(:user) }
  #   let!(:party_journal) { create(:party_journal) }
  #
  #   before do
  #     visit journal_path(user_journal)
  #   end
  #
  #   it "shows user's notes from their joined journal"
  #   it "shows notes of the other journal party members"
  #   it "does not show other's private notes"
  #   it "does show user's own private notes"
  # end
end
