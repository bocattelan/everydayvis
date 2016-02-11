class SmadaController < ApplicationController

  def dados
    @dados = []
    @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 1 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 2 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 3 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 4 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 5 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 6 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 7 AND timestamp > '2016-01-30 11:00'")
  end

  def index
    # @bagulho = Dados.where(sub_sensor_id: 1)

    @sensorId = []
    @sensorId << Smada.conn.execute("SELECT DISTINCT id_sensor FROM data;")

    @dados = []

    @sensorId.first.each do |id|
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 1 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 2 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 3 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 4 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 5 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 6 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 7 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
    end
  end

  def last_hours
    @sensorId = []
    @sensorId << Smada.conn.execute("SELECT DISTINCT id_sensor FROM data;")

    @dados = []

    @sensorId.first.each do |id|
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 1 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 2 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 3 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 4 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 5 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 6 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE sub_sensor_id = 7 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
    end
  end
  
end

# Schema |     Name     | Type  |  Owner
#--------+--------------+-------+----------
# public | data         | table | postgres
# public | end_dev_type | table | postgres
# public | end_device   | table | postgres
# public | gateway      | table | postgres
# public | sensors      | table | postgres
