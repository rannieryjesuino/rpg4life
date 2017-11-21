class PlayersController < ApplicationController

  def create
    parametros = params.require(:player).permit :nome, :personagem
    @jogador = Player.new parametros
    if @jogador.save
      flash[:notice] = "Jogador salvo com sucesso!"
      redirect_to players_url
    else
      render :new
    end
  end

  def new
    @jogador = Player.new
  end

  def destroy
    id = params[:id]
    Player.destroy(id)
    redirect_to players_url
  end

  def busca
    @nome_a_buscar = params[:nome]
    @jogadores = Player.where "nome like ?", "%#{@nome_a_buscar}%"
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
