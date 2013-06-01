class Search < ActiveRecord::Base
  attr_accessible :query
  serialize :query, ActiveRecord::Coders::Hstore
  Video = Struct.new(:title, :thumbnail, :youtube_id)


  class << self
    def client
      @client ||= YouTubeIt::Client.new(:dev_key => YOUTUBE_API_KEY)
    end

    def clean(query)
      query.downcase.gsub(/\s+/, " ").strip
    end

    def get_youtube_results(query)
      client.videos_by(:query => query, :page => 1, :per_page => 5).videos
    end

    def create_from_youtube(query)
      c_query = clean(query)
      results = get_youtube_results(c_query).to_json
      create(:query => {c_query => results})
    end
  end

  def parse
    key = self.query.keys.first
    JSON.parse(query[key])
  end

  def video_results
    parse.map do |video|
      Video.new(video["title"], video["thumbnails"].first["url"], video["unique_id"])
    end
  end
end


