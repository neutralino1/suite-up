class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @theme = @round.theme
  end

  def update
    observed, status, result_id = params[:observed], params[:status], params[:result_id]
    result_id.each_with_index do |r, i|
      result = Result.find(r.to_i)
      result.update_attributes(:observed => observed[i], :status => status[i])
    end
    redirect_to round_path(params[:id])
  end
end
