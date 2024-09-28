class Api::V1::Reservations::CheckAvailabilityService

  def initialize(params)
    @machine = Machine.find(params[:machine_id])
    @start_time = params[:start_time]
    @end_time = params[:end_time]
  end

  def call
    @machine.available_for_reservation?(@start_time, @end_time)
  end
end