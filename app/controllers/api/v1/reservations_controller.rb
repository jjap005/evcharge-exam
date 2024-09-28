class Api::V1::ReservationsController < ApplicationController

  def create
    reservation = Api::V1::Reservations::CreateService.new(reservation_params).call

    if reservation
      render json: reservation, status: :created
    else
      render json: { error: "la máquina no está disponible para el tiempo solicitado." }, status: :unprocessable_entity
    end
  end

  def check_availability
    available = Api::V1::Reservations::CheckAvailabilityService.new(check_params).call

    render json: {available: available}, status: :ok
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :machine_id, :start_time, :end_time)
  end

  def check_params
    params.permit(:user_id, :machine_id, :start_time, :end_time)
  end
end
