class AttendancesController < ApplicationController

  def create
      parametros = params.require(:attendance).permit :player_id, :session_id, :presenca, :justificativa
      a = Attendance.new
      a.presenca = parametros[:presenca]
      a.justificativa = parametros[:justificativa]
      a.player = Player.find_by id: parametros[:player_id]
      a.session = Session.find_by id: parametros[:session_id]
      if a.save
        redirect_to root_url
      end
  end

  def new
    @choices = Choice.all
  end

  def edit
    @attendance = Attendance.find params[:id]
  end

  def update
    parametros = params.require(:attendance).permit :presenca, :justificativa, :id
    attendance = Attendance.find parametros[:id]
    Attendance.update(parametros[:id], :presenca => parametros[:presenca], :justificativa => parametros[:justificativa])
    redirect_to root_url
  end

  def destroy
    id = params[:id]
    Attendance.destroy(id)
    redirect_to root_url
  end

end
