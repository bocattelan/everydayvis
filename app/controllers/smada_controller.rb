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
    @sensorId << Dados.select('id_sensor')

    @dados = []

    @sensorId.first.each do |id|
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 1 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 2 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 3 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 4 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 5 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 6 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
      @dados << Smada.conn.execute("SELECT * FROM data WHERE id_end_device = 7 AND timestamp > '" + 6.hours.ago.to_s + "' AND id_sensor =" + id["id_sensor"].to_s)
    end
  end
  
end

# Schema |     Name     | Type  |  Owner
#--------+--------------+-------+----------
# public | data         | table | postgres |||| id_gtw | id_end_device | id_sensor | payload |      localizacao      |      timestamp
# public | end_dev_type | table | postgres
# public | end_device   | table | postgres
# public | gateway      | table | postgres
# public | sensors      | table | postgres
