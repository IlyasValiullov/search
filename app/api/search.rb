
module API
  class Search < Grape::API
    format :json
    prefix :api

    desc 'Search in language list'
    params do
      requires :query, type: String, desc: 'Search query.'
    end
    get :search do
      languages = ::Repository.for(:language).all
      ::Search::SearchQuery.new(params[:query], languages).execute
    end

    # Simple endpoint to get the current status of our API.
    get :status do
      {status: 'ok'}
    end
  end
end
