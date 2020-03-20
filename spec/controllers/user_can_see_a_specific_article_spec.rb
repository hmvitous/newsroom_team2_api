RSpec.describe 'Get/api/articles/', type: :request do
  describe 'GET/articles' do
    @article = Article.create(title: "Corona is viral", 
        teaser: "Is there something you can do?", content: "NO. sorry there isn't.")
    @article = Article.create(title: "Corona is defeated!!", 
        teaser: "We are saved?", content: "NO! Recession is coming next!")
        
    before do
      # create(:article, title: "coronavirus", teaser: "The World goverments cannot manage it", content: "it's spreading all around the world")
      get '/api/articles/2'
    end

    it 'should return a 200 response' do
      expect(response.status).to eq 200
    end

    it 'should return id 2' do
      expect((response_json)["id"]).to eq 2
    end

    it 'should return valid title' do
      expect((response_json)["title"]).to eq "Corona is defeated!!"
    end

    it 'should return valid teaser' do
      expect((response_json)["teaser"]).to eq "We are saved?"
    end

    it 'should return valid teaser' do
      expect((response_json)["content"]).to eq "NO! Recession is coming next!"
    end
  end

  describe 'GET/articles [sad path]' do
    before do
      get '/api/articles/10000000'
    end

    it 'should return a 404 response' do
      binding.pry
      expect(response.status).to eq 404
    end
  end
end
