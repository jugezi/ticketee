require 'spec_helper'

feature "Editing Projects" do
  before do
    sign_in_as!(FactoryGirl.create(:admin_user))
    FactoryGirl.create(:project, name: "Textmate 2")

    visit '/'
    click_link "Textmate 2"
    click_link "Edit Project"
  end

  scenario "Updating a project" do
    fill_in "Name", with: "Textmate 2 beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end

  scenario "Updating a project with invalid attributes is bad" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has not been updated.")
  end
end
