require 'daemon_spawn'

# rails r lib/my_daemon.rb start & デーモン起動
class MyDeamon < DaemonSpawn::Base
  def start(args)
    num = 0
    loop do
      # Rails.logger.info(Time.current)
      p "start #{num}"
      num += 1
      sleep 1
    end
  end

  def stop
    p "stop"
  end
end

MyDeamon.spawn!({
    :working_dir => "./",
    :pid_file => "./pid.log",
    :log_file => "./daemon.log"
                })

# class MyDaemon < DaemonSpawn::Base
#   def start(args)
#     # puts Rails.root
#     loop do
#       Rails.logger.info(Time.current)
#       sleep 1
#     end
#   end
# end

# MyDaemon.spawn!(
#     # working_dir: Rails.root,
#     # pid_file: "#{Rails.root}/tmp/my_daemon.pid",
#     # log_file: "#{Rails.root}/log/my_daemon.log",
#     working_dir: "./",
#     pid_file: "./tmp/my_daemon.pid",
#     log_file: "./log/my_daemon.log",  
# )

