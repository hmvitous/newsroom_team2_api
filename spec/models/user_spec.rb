# frozen_string_literal: true

RSpec.describe User, type: :model do
  it 'should have a valid Factory' do
    expect(create(:user)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :role }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :role }
    it { is_expected.to validate_confirmation_of :password }
    
    context 'should not have an invalid email address' do
      emails = ['asdasd@ dsd.com', '@thomas.se', 'AnotherTEST @gmail.com']
      emails.each do |email|
        it { is_expected.not_to allow_value(email).for(:email) }
      end
    end

    context 'should have a valid email address' do
      emails = ['asdasd@dsd.com', 'swedenbest@thomas.se', 'anothertestWithoutspace@gmail.com']
      emails.each do |email|
        it { is_expected.to allow_value(email).for(:email) }
      end
    end
  end
end
