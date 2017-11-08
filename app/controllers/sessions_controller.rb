class SessionsController < ApplicationController

  def index
    @sessoes_por_data = Session.order(:data).reverse
  end

  def create
    parametros = params.require(:session).permit :data
    sessao = Session.create parametros
    redirect_to sessions_list_url
  end

  def destroy
    id = params[:id]
    Session.destroy(id)
    redirect_to sessions_list_url
  end

end
