require 'spec_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', with: 'Textmate 2'
    fill_in 'Description', with: 'A text-editor for OS X'
    click_button 'Create Project'

    project = Project.where(name: "TextMate 2").first

    expect(page).to have_content('Project has been created.')

    title = "Textmate 2 - Projects - Ticketee"

    expect(page).to have_title title
  end
end
