require 'rails_helper'

RSpec.describe MovieParty, type: :model do
  describe 'relationships' do
    it { should belong_to(:user)}
    it { should have_many(:invites)}
    it { should have_many(:users).through(:invites)}
  end
end
