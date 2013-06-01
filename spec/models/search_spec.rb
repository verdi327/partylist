require 'spec_helper'

describe Search do
  let(:search_record) { Search.create_from_youtube("party in the usa") }

  describe ".client" do
    it "creates a youtube client" do
      Search.client.should be_an_instance_of(YouTubeIt::Client)
    end
  end

  describe ".clean" do
    it "strips a string of extra whitespace and downcases it" do
      Search.clean(" BillY    is a DoG ").should == "billy is a dog"
    end
  end

  describe ".get_youtube_results", :vcr, record: :all do
    before do
      #VCR.use_cassette 'search/youtube_response' do
        @response = Search.get_youtube_results("party in the usa")
      #end
    end

    it "returns a YouTubeIt object" do
      @response.first.should be_an_instance_of(YouTubeIt::Model::Video)
    end

    it "returns five results" do
      @response.count.should == 5
    end
  end

  describe ".create_from_youtube" do
    it "creates a new search record" do
      search_record.should be_an_instance_of(Search)
    end

    it "stores the original query as the key for the search record" do
      search_record.query.should have_key("party in the usa")
    end

    it "serializes the results from youtube into json" do
      JSON.parse(search_record.query["party in the usa"]).first.should be_a(Hash)
    end
  end

  describe "#parse" do
    it "parses a json string" do
      search_record.parse.should be_a(Array)
      search_record.parse.first.should be_a(Hash)
    end
  end

  describe "#video_results" do
    it "maps hash values to struct video objects" do
      results = search_record.video_results
      results.should be_a(Array)
      results.first.methods.should include(:title, :thumbnail, :youtube_id)
    end
  end

end
