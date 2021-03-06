require 'spec_helper'

describe "StaticPages" do

subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',  text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Bento App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should have_content 'Bento' }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_content 'HALP' }
    it { should have_selector 'title', :text => "Help" }
  end

  describe "About page" do 
    before {  visit about_path }
    it { should have_content 'About Bento' }
    it { should have_selector 'title', :text => "Bento App | About" }
  end

  describe "Contact page" do
    before {  visit contact_path }
    it { should have_selector 'h1', text: 'Contact' }
    it { should have_selector 'title', text: "Contact" }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Bento')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "bento app"
    page.should have_selector 'title', text: 'Bento App'
  end

end
