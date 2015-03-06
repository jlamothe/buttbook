require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET home" do
    before do
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
