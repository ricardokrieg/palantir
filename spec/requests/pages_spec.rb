require 'spec_helper'

describe "Pages" do
    before :each do
        @sign_in_link = 'Sign in via Github'
        @sign_out_link = 'Sign out'
    end

    context "when signed in" do
        it "does not show the sign in link" do
            visit root_path
            should_not have_content @sign_in_link
        end

        it "shows the sign out link" do
            visit root_path
            should have_content @sign_out_link
        end
    end

    context "when not signed in" do
        it "shows the sign in link" do
            visit root_path
            should have_content @sign_in_link
        end

        it "does not show the sign out link" do
            visit root_path
            should_not have_content @sign_out_link
        end
    end
end
