class PeopleController < ApplicationController
  decorates_assigned :person

  def index
    @people = Person.all.decorate
  end

  def show
    @person = Person.find(params[:id])
    
    @calendar = @person.days.map do |day|
      { activity: day.activities.sum(:activity), weather: day.weathers.first, datetime: day.date }
    end

    @map = 'lolololo' #map person.map_data.to_json

    locations.map do |l|
      {
        date: l.datetime.to_date,
        lat: l.latitude,
        lng: l.longitude,
        activity: on_date(Time.zone.local(l.datetime.year, l.datetime.month, l.datetime.day, 0, 0, 0)).sum(:activity)
      }
    end
  end

  def person_hour
    person = Person.find(params[:id])
    datetime = Time.zone.local(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, 0, 0)
    render json: person.day(datetime.to_date).activities_at_hour(datetime).map(&:activity)
  end

  def clock_day
    person = Person.find(params[:id])
    date = Time.zone.local(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    day = person.day(date)
    clock_data = {
      user_id: person.id,
      date: date,
      sunrise: day.sunrise,
      sunset: day.sunset,
      max_activity: day.activities.map(&:activity).max
    }

    clock_data[:activities]   = day.activities_with_interval(60) if day.has(:activities)
    clock_data[:luminosity]   = day.luminosity_with_interval(60) if day.has(:luminosities)
    clock_data[:works]        = day.works                        if day.has(:works)
    clock_data[:weather]      = day.weathers.first               if day.has(:weathers)

    render json: clock_data
  end

  def histogram_day
    person = Person.find(params[:id])
    date = Time.zone.local(params[:year].to_i, params[:month].to_i, params[:day].to_i)

    render json: person.day(date).activities
  end

end
