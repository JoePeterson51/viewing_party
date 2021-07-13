require 'rails_helper'

RSpec.describe Invite, type: :model do
  describe 'relationships' do
    it { should belong_to(:user)}
    it { should belong_to(:movie_party)}
  end
end
