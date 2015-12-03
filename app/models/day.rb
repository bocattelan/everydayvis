class Day < ActiveRecord::Base

  belongs_to :person

  has_many :activities,   dependent: :destroy
  has_many :luminosities, dependent: :destroy
  has_many :locations,    dependent: :destroy
  has_many :weathers,     dependent: :destroy
  has_many :daylights,    dependent: :destroy
  has_many :works,        dependent: :destroy
  has_many :appointments, dependent: :destroy

  alias :associated_activities   :activities
  alias :associated_luminosities :luminosities
  alias :associated_locations    :locations
  alias :associated_weathers     :weathers
  alias :associated_daylights    :daylights
  alias :associated_works        :works
  alias :associated_appointments :appointments

  def locations
    associated_locations.where("datetime BETWEEN ? AND ?", dt, dt + 1.day - 1.second).order("datetime ASC")
  end

  def weathers
    associated_weathers.where(date: date)
  end

  def daylights
    associated_daylights.where("sunrise BETWEEN ? AND ?", dt, dt + 1.day - 1.second).order("sunrise ASC")
  end

  def sunrise
    sunrise = daylights.first
    return sunrise.sunrise if sunrise
    return DateTime.new(2015, 1, 1, 6, 12, 0) # I surprise myself with this kind of gambi
  end

  def sunset
    sunset = daylights.first
    return sunset.sunset if sunset
    return DateTime.new(2015, 1, 1, 19, 14, 0)
  end

  def works
    associated_works.where("start BETWEEN ? AND ?", dt, dt + 1.day - 1.second).order("start ASC")
  end

  def appointments
    associated_appointments.where("datetime BETWEEN ? AND ?", dt, dt + 1.hour - 1.second)
  end

  def activities
    associated_activities.where("datetime BETWEEN ? AND ?", dt, dt + 1.day - 1.second).order("datetime ASC")
  end

  def luminosities
    associated_luminosities.where("datetime BETWEEN ? AND ?", dt, dt + 1.day - 1.second).order("datetime ASC")
  end

  def activities_at_hour(datetime)
    associated_activities.where("datetime BETWEEN ? AND ?", dt - 1.hour, dt).order("datetime ASC")
  end

  # this is also not very beautiful
  def activities_with_interval(interval)
    sum = 0
    activities.map{|a| [a.datetime, a.activity]}.each do |activity|
      if activity[0] - current < interval.minutes
        sum += activity[1]
      else
        while activity[0] - current > interval.minutes
          current += 1.hour
          day << { activity: sum, ev: (appointments.count > 0) }
        end
        sum = activity[1]
      end
    end
    while day.count < 24
      day << { activity: 0, ev: false }
    end
    return day
  end

  def luminosity_with_interval(interval)
    day = []
    current = date.dup
    sum = 0
    luminosities.map{|l| [l.datetime, l.light]}.each do |luminosity|
      if luminosity[0] - current < interval.minutes
        sum += luminosity[1]
      else
        while luminosity[0] - current > interval.minutes
          current += 1.hour
          day << sum
        end
        sum = luminosity[1]
      end
    end
    while day.count < 24
      day << 0
    end
    return day
  end

  def has(attribute)
    !self.send(attribute).empty?
  end

  private

  def dt
    Time.zone.local(date.year, date.month, date.day, 0, 0, 0)
  end

end
