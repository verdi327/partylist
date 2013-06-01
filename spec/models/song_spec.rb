require "spec_helper"

describe Song do
  it "can be instantiated" do
    Song.new.should be_an_instance_of(Song)
  end
end