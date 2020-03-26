require 'rails_helper'

RSpec.describe Article, type: :model do
  
  it 'should have valid Factory' do
    expect(create(:article)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :teaser }
    it { is_expected.to have_db_column :content }
    it { is_expected.to have_db_column :article_class }
    
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title}
    it { is_expected.to validate_presence_of :teaser }
    it { is_expected.to validate_presence_of :content}
    it { is_expected.to validate_presence_of :article_class } 
  end
end