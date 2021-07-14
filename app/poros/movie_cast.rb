class MovieCast
  attr_reader :character, :name
  def initialize(cast_hash)
    @character = cast_hash[:character]
    @name = cast_hash[:name]
  end
end