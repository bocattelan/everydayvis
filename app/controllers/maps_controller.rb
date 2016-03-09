class MapsController < ApplicationController

  def index
    #Localizações que teremos instrumentos:
    #Latitude: -29.783223 | Longitude: -51.153387 - Casa do Ivan
    #Latitude: -30.068329 | Longitude: -51.120235 - Laboratório INF 1
    #Latitude: -30.07097 | Longitude: -51.120042 - Faurgs
    #Latitude: -27.548028 | Longitude: -48.498096 - Senai-SC
    #Latitude: -23.556813 | Longitude: -46.734678 - IPT
    #@locations = ['-29.783223 -51.153387','-30.068329 -51.120235', '-30.07097 -51.120042','-27.548028 -48.498096', '-23.556813 -46.734678']
    @sensorId = []
    @sensorId = Dados.select('id_sensor').uniq

    @sensorName = []
    @sensorName = Sensor.all

    @sensorName.each do |sensor|
      if sensor["id_sensor"] == 1
        sensor["sensor_name"] = 'Luminosidade'
      elsif sensor["id_sensor"] == 2
        sensor["sensor_name"] = 'temperatura'
      elsif sensor["id_sensor"] == 3
        sensor["sensor_name"] = 'Umidade'
      elsif sensor["id_sensor"] == 4
        sensor["sensor_name"] = 'Pressão Atmosférica'
      elsif sensor["id_sensor"] == 5
        sensor["sensor_name"] = 'Chuva'
      elsif sensor["id_sensor"] == 6
        sensor["sensor_name"] = 'Velocidade do vento'
      elsif sensor["id_sensor"] == 7
        sensor["sensor_name"] = 'Direção do vento'
      elsif sensor["id_sensor"] == 10
        sensor["sensor_name"] = 'Chuva (coordenador)'
      elsif sensor["id_sensor"] == 11
        sensor["sensor_name"] = 'CO'
      elsif sensor["id_sensor"] == 12
        sensor["sensor_name"] = 'CO2'
      elsif sensor["id_sensor"] == 13
        sensor["sensor_name"] = 'NO2'
      elsif sensor["id_sensor"] == 14
        sensor["sensor_name"] = 'UV'
      elsif sensor["id_sensor"] == 15
        sensor["sensor_name"] = 'DUST'
      end
    end

    @endDeviceId = []
    @endDeviceId = Dados.select('id_end_device').uniq

    @dados = []
    @endDeviceId.each do |end_device|
      @sensorId.each do |id_sensor|
        @dados << Dados.where("id_end_device = ? AND id_sensor = ?", end_device["id_end_device"].to_s, id_sensor["id_sensor"].to_s).order("timestamp")
      end
    end
  end

  def real_time
    #Localizações que teremos instrumentos:
    #Latitude: -29.783223 | Longitude: -51.153387 - Casa do Ivan
    #Latitude: -30.068329 | Longitude: -51.120235 - Laboratório INF 1
    #Latitude: -30.07097 | Longitude: -51.120042 - Faurgs
    #Latitude: -27.548028 | Longitude: -48.498096 - Senai-SC
    #Latitude: -23.556813 | Longitude: -46.734678 - IPT
    #@locations = ['-29.783223 -51.153387','-30.068329 -51.120235', '-30.07097 -51.120042','-27.548028 -48.498096', '-23.556813 -46.734678']
    @sensorId = []
    @sensorId = Dados.select('id_sensor').uniq

    @sensorName = []
    @sensorName = Sensor.all

    @sensorName.each do |sensor|
      if sensor["id_sensor"] == 1
        sensor["sensor_name"] = 'Luminosidade'
      elsif sensor["id_sensor"] == 2
        sensor["sensor_name"] = 'temperatura'
      elsif sensor["id_sensor"] == 3
        sensor["sensor_name"] = 'Umidade'
      elsif sensor["id_sensor"] == 4
        sensor["sensor_name"] = 'Pressão Atmosférica'
      elsif sensor["id_sensor"] == 5
        sensor["sensor_name"] = 'Chuva'
      elsif sensor["id_sensor"] == 6
        sensor["sensor_name"] = 'Velocidade do vento'
      elsif sensor["id_sensor"] == 7
        sensor["sensor_name"] = 'Direção do vento'
      elsif sensor["id_sensor"] == 10
        sensor["sensor_name"] = 'Chuva (coordenador)'
      elsif sensor["id_sensor"] == 11
        sensor["sensor_name"] = 'CO'
      elsif sensor["id_sensor"] == 12
        sensor["sensor_name"] = 'CO2'
      elsif sensor["id_sensor"] == 13
        sensor["sensor_name"] = 'NO2'
      elsif sensor["id_sensor"] == 14
        sensor["sensor_name"] = 'UV'
      elsif sensor["id_sensor"] == 15
        sensor["sensor_name"] = 'DUST'
      end
    end

    @endDeviceId = []
    @endDeviceId = Dados.select('id_end_device').uniq

    @dados = []
    @endDeviceId.each do |end_device|
      @sensorId.each do |id_sensor|
        @dados << Dados.where("id_end_device = ? AND id_sensor = ?", end_device["id_end_device"].to_s, id_sensor["id_sensor"].to_s).order("timestamp").last(1)
      end
    end
  end

end
