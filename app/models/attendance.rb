class Attendance < ApplicationRecord
  belongs_to :session
  belongs_to :player

  def opcao
    if(presenca)
      "Sim"
    else
      "Não"
    end
  end

end
