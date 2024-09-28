class Api::V1::Reservations::CreateService

  def initialize(params)
    @params = params
    @machine = Machine.find(params[:machine_id])
  end

  def call
    @reservation = Reservation.new(@params)

    return nil if machine_available?(@reservation.start_time, @reservation.end_time)

    @reservation.save
    @reservation
  end

  private

  def machine_available?(start_time, end_time)
    @machine.available_for_reservation?(start_time,end_time)
  end
end