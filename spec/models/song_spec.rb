require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:valid_song) { Song.new(title: "ValidSong", artist: "TestArtist", path: "public/song_files/validsong.pdf") }
  let(:titleless_song) { Song.new(artist: "TestArtist", path: "public/song_files/validsong.pdf") }
  let(:artistless_song) { Song.new(title: "ArtistlessSong", path: "public/song_files/validsong.pdf") }
  let(:pathless_song) { Song.new(title: "PathlessSong", artist: "TestArtist") }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(valid_song).to be_valid
    end

    it "is not valid without a title" do
      expect(titleless_song).to be_invalid
    end

    it "is not valid without an artist" do
      expect(artistless_song).to be_invalid
    end

    it "is not valid without a file path" do
      expect(pathless_song).to be_invalid
    end

  let(:valid_song_duplicate) { Song.new(title: "ValidSong", artist: "TestArtist", path: "differentpath") }

    it "is not valid if a song exists with same title and artist" do
      valid_song.save
      expect(valid_song_duplicate).to be_invalid
    end
  end
end
