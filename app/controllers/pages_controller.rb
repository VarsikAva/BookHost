class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    response = HTTParty.get('https://fakerapi.it/api/v1/books', query: {
      _locale: 'fr_FR',
      _quantity: 5 # Par exemple, on récupère 5 livres
    })

    if response.success?
      @books = response.parsed_response['data']
    else
      @error = "Impossible de récupérer les livres."
    end
  end
end
