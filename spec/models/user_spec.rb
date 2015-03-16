require_relative '../support/resource.rb'

RSpec.describe User, type: :model do
  subject { build :user }
  include_examples 'a resource'

  context 'self-permissions' do
    let(:ability) { Ability.new(subject) }

    before do
      subject.save!
    end

    [:show, :edit, :update, :delete].each do |action|
      it "should be able to #{ action } themselves" do
        expect(ability.can? action, subject).to be true
      end
    end
  end
end
