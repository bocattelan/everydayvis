class SmadaController < ApplicationController

  def dados
    @dados = []
    @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 1 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 2 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 3 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 4 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 5 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 6 AND timestamp > '2016-01-30 11:00'")
    @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 7 AND timestamp > '2016-01-30 11:00'")
  end

  def index
    # @bagulho = Dados.where(sub_sensor_id: 1)

    @sensorId = []
    @sensorId << Smada.conn.execute("SELECT DISTINCT id_sensor FROM data;")

    @dados = []

    @sensorId.first.each do |id|
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 1 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 2 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 3 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 4 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 5 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 6 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 7 AND timestamp > '2016-01-30 11:00' AND id_sensor =" + id["id_sensor"].to_s)
    end
  end

  def last_hours
    @sensorId = []
    #@sensorId << Smada.conn.execute("SELECT DISTINCT id_sensor FROM data;")
    @sensorId << Dados.select('id_sensor').uniq

    @endDeviceId = []
    @endDeviceId << Dados.select('id_end_device').uniq

    @dados = []

    @sensorId.each do |id_sensor|
      @endDeviceId.each do |end_device|
        @dados << Dados.where("id_end_device = " + end_device[0]["id_end_device"].to_s + " AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id_sensor[0]["id_sensor"].to_s)
      end
    end
  end
end

      #@dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 2 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)


# Schema |     Name     | Type  |  Owner
#--------+--------------+-------+----------
# public | data         | table | postgres |||| id_gtw | id_end_device | id_sensor | payload |      localizacao      |      timestamp
# public | end_dev_type | table | postgres
# public | end_device   | table | postgres
# public | gateway      | table | postgres
# public | sensors      | table | postgres
