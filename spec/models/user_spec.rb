require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:movie_parties)}
    it { should have_many(:invites)}
    it { should have_many(:movie_parties).through(:invites)}
    it { should have_many(:friendships)}
    it { should have_many(:friends).through(:friendships)}
    it { should have_many(:inverse_friendships).class_name('Friendship').with_foreign_key('friend_id')}
    it { should have_many(:inverse_friends).through(:inverse_friendships).source(:user)}
  end

  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_confirmation_of(:password)}
  end
end