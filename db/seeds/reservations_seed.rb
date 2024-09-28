Reservation.destroy_all
users = User.all
machines = Machine.all

if users.empty? || machines.empty?
  puts "No hay usuarios o máquinas para crear reservas."
else
  start_time = Time.current
  end_time = start_time.end_of_day

  machines.each do |machine|
    num_reservations = rand(0..3)

    num_reservations.times do
      user = users.sample
      reservation_start = Time.at(rand(start_time.to_i..end_time.to_i))
      reservation_end = reservation_start + rand(30..120 * 60)

      Reservation.create!(
        user: user,
        machine: machine,
        start_time: reservation_start,
        end_time: reservation_end
      )

      puts "Reserva creada para la máquina #{machine.id} por el usuario #{user.id} de #{reservation_start} a #{reservation_end}."
    end
  end
end
