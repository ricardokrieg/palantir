require 'spec_helper'

describe "Pages" do
    before :each do
        @github_link = 'Sign in via Github'
    end

    it "shows the login link" do
        visit root_path
        should have_content @github_link
    end
end
