require 'rails_helper'

describe 'a user visits the homepage' do
  context 'the user searches for a zipcode' do
    it 'the user sees station data returned' do

      visit "/"

      fill_in "q", with: 80203

      click_button "Locate"

      expect(current_path).to eq("/search")

      expect(page).to have_css(".station", maximum: 10)

      expect(page).to_not have_content("LNG")
      expect(page).to_not have_content("E85")
      expect(page).to_not have_content("CNG")
      expect(page).to_not have_content("BD")
      expect(page).to_not have_content("all")

      within(first(".station")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".address")
        expect(page).to have_css(".fuel-type")
        expect(page).to have_css(".distance")
        expect(page).to have_css(".access-times")
      end
    end
  end
end
