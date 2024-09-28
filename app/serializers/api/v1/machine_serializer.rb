class MachineSerializer < ActiveModel::Serializer
  attributes :id, :name, :model, :supplier, :status, :free_schedule, :occupied_schedule

  def free_schedule
    time_slots(:free)
  end

  def occupied_schedule
    time_slots(:occupied)
  end

  private

  def time_slots(status)
    slots = []
    start_time = Time.current.beginning_of_day
    end_time = start_time.end_of_day

    (start_time.to_i..end_time.to_i).step(30.minutes).each do |timestamp|
      slot_start = Time.at(timestamp)
      slot_end = slot_start + 30.minutes

      reservation = object.reservations.find do |r|
        r.start_time < slot_end && r.end_time > slot_start
      end

      if status == :occupied
        if reservation
          slots << {
            time: slot_start.strftime("%H:%M"),
            reservation_id: reservation.id,
            user_id: reservation.user_id
          }
        end
      elsif status == :free
        unless reservation
          slots << {
            time: slot_start.strftime("%H:%M"),
            reserved: false
          }
        end
      end
    end

    slots
  end
end