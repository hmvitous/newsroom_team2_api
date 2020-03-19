require 'rails_helper'

RSpec.describe Article, type: :model do
  
  it 'should have valid Factory' do
    expect(create(:article)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :teaser }
    it { is_expected.to have_db_column :content }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title}
    it { is_expected.to validate_presence_of :teaser }
    it { is_expected.to validate_presence_of :content } 
  end

  describe "Check if new article is created" do
    before do
      @article = Article.new(title: "Corona is viral", teaser: "Is there something you can do?", content: "NO. sorry there isn't.")
    end  

    it "expects to contain title" do
    expect(@article.title).to eq("Corona is viral")
    end
    it "expects to contain the description" do      
      expect(@article.teaser).to eq("Is there something you can do?")
    end
    it "expects to contain the description" do      
      expect(@article.content).to eq("NO. sorry there isn't.")
    end
  end
end