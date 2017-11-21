class SessionsController < ApplicationController

  def index
    @sessoes_por_data = Session.order(:data).reverse
  end

  def create
    parametros = params.require(:session).permit :data
    @sessao = Session.new parametros
    if @sessao.save
      flash[:notice] = "Sessao salva com sucesso!"
      redirect_to sessions_list_url
    else
      render :new
    end
  end

  def new
    @sessao = Session.new
  end

  def destroy
    id = params[:id]
    Session.destroy(id)
    redirect_to sessions_list_url
  end

end
