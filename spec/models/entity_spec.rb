require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Rida Arif', email: 'example@mail.com', password: 'password') }
  let(:group) { Group.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: user.id) }
  let(:entity) { Entity.create(name: 'Dress', amount: 12, user_id: user.id) }

  describe 'Validations' do
    it 'should valid name ' do
      entity.name = nil
      expect(entity).to_not be_valid
    end
    it 'should valid amount ' do
      entity.amount = -10
      expect(entity).to_not be_valid
    end
  end
end