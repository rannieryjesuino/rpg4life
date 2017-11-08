class PlayersController < ApplicationController

  def create
    parametros = params.require(:player).permit :nome, :personagem
    jogador = Player.create parametros
    redirect_to players_url
  end

  def destroy
    id = params[:id]
    Player.destroy(id)
    redirect_to players_url
  end

  def edit
    @player = Player.find params[:id]
  end

  def update
    parametros = params.require(:player).permit :nome, :personagem, :id
    jogador = Player.find parametros[:id]
    Player.update(parametros[:id], :nome => parametros[:nome], :personagem => parametros[:personagem])
    redirect_to players_url
  end

end
