require 'rails_helper'

describe 'The Job Paths', type: :feature, :js => true do
  describe 'The Job Creation Processes' do
    before(:each) do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit jobs_path
      click_link 'Add New Job'
      fill_in 'Description', :with => 'So Descriptive!'
    end
    it 'allows the user to create new jobs' do
      fill_in 'Title', :with => 'New Job'
      click_button 'Create Job'
      expect(page).to have_content 'So Descriptive!'
    end
    it 'prevents the user from creating a job without a title' do
      click_button 'Create Job'
      expect(page).to have_content 'There was an error.'
    end
  end
  describe 'The Job Update and Delete Processes' do
    before(:each) do
      worker = FactoryGirl.create(:worker)
      login_as(worker, :scope => :user)
      FactoryGirl.create(:job)
      visit jobs_path
      click_link 'Claim'
    end

    it 'allows a worker to claim posted jobs' do
      expect(page).to have_content 'Status: Pending'
    end

    it 'allows a worker to mark a job as complete' do
      click_link 'Complete'
      expect(page).to have_content 'Status: Completed'
    end

    it 'allows a worker to delete a completed job' do
      click_link 'Complete'
      click_link 'Delete'
      expect(page).to have_content 'You\'ve successfully deleted this job.'
    end
  end
end