class SmadaController < ApplicationController

  def dados
    @dados = []
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 1 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 2 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 3 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 4 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 5 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 6 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 7 AND timestamp > '2016-01-30 11:00'")
  end

  def index
    @sensorId = []
    @sensorId << Smada.conn.select_all "SELECT DISTINCT id_sensor FROM dados;"

    @dados = []

    @sensorId.each do |id|
      @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 1 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id.to_s)
      @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 2 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id.to_s)
      @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 3 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id.to_s)
      @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 4 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id.to_s)
      @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 5 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id.to_s)
      @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 6 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id.to_s)
      @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 7 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id.to_s)
    end
  end

  def last_hours
    @dados = []
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 1 AND timestamp > '" + 6.hours.ago.to_s + "'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 2 AND timestamp > '" + 6.hours.ago.to_s + "'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 3 AND timestamp > '" + 6.hours.ago.to_s + "'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 4 AND timestamp > '" + 6.hours.ago.to_s + "'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 5 AND timestamp > '" + 6.hours.ago.to_s + "'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 6 AND timestamp > '" + 6.hours.ago.to_s + "'")
    @dados << Smada.conn.execute("SELECT * FROM dados WHERE sub_sensor_id = 7 AND timestamp > '" + 6.hours.ago.to_s + "'")
  end

end
