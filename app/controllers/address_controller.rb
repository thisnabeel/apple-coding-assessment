class AddressController < ApplicationController
  def suggestions
    @suggestions = AddressSuggestor.call(params[:address])
    render json: render_to_string(partial: 'address/suggestions', locals: { suggestions: @suggestions })
  end
end