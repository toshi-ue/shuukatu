module GenresToshort
  extend ActiveSupport::Concern

  private
  def set_genres
    @genres = Genre.all.includes(:subgenres)
  end
end
