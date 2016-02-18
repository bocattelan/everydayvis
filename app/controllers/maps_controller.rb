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

    @endDeviceId = []
    @endDeviceId = Dados.select('id_end_device').uniq

    @dados = []
    @endDeviceId.each do |end_device|
      @sensorId.each do |id_sensor|
        @dados << Dados.where("id_end_device = ? AND id_sensor = ?", end_device["id_end_device"].to_s, id_sensor["id_sensor"].to_s).order("timestamp")
      end
    end
  end

end
