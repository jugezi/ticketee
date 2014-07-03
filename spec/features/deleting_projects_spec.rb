require 'spec_helper'

feature "Deleting projects" do
  scenario "Deleting a project" do
    FactoryGirl.create(:project, name: "Textmate 2")

    visit '/'
    click_link "Textmate 2"
    click_link "Delete Project"

    expect(page).to have_content("Project has been destroyed.")
  end
end
