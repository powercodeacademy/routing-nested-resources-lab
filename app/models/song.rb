class Song < ActiveRecord::Base
  belongs_to :artist, optional: true

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name) if !name.blank?
    self.artist = artist
  end
end
