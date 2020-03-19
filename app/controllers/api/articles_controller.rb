class Api::ArticlesController < ApplicationController
  def index
    render json: {header: 'Pong', content:'blablabla.', teaser: "I'm your father."}, status: 200
  end
end
