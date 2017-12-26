class PlayersController < ApplicationController

  before_action pegar_parametros, only: [:create, :update]

  def busca
    @nome_a_buscar = params[:nome]
    @jogadores = Player.where "nome like ?", "%#{@nome_a_buscar}%"
  end

  def edit
    @jogador = Player.find params[:id]
  end

  def new
    @jogador = Player.new
  end

  def create
    @jogador = Player.new @parametros
    if @jogador.save
      flash[:notice] = "Jogador salvo com sucesso!"
      redirect_to players_url
    else
      render :new
    end
  end

  def update
    id = params[:id]
    @jogador = Player.find(id)
    # Player.update(parametros[:id], :nome => parametros[:nome], :personagem => parametros[:personagem])
    if @jogador.update @parametros
      flash[:notice] = "Jogador atualizado com sucesso!"
      redirect_to players_url
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
    Player.destroy(id)
    redirect_to players_url
  end

# -------------------------------------------------------------------------------------------
#                                    PRIVATE AREA
# -------------------------------------------------------------------------------------------

  private

  def pegar_parametros
    @parametros = params.require(:player).permit :nome, :personagem
  end

end
