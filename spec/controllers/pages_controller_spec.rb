require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views
  let(:user) { create :user }

  [true, false].each do |signed_in|
    context "when a user is #{ signed_in ? '' : 'not ' }signed in" do
      describe "GET home" do
        before do
          sign_in user if signed_in
          get :home
        end

        it 'should not throw an exception' do
          expect { response }.to_not raise_error
        end

        it 'should render the pages/home view' do
          expect(response).to render_template('pages/home')
        end
      end
    end
  end
end
