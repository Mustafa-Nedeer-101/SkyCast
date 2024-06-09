class WeatherForecast {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherForecast({this.location, this.current, this.forecast});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        location: json['location'] != null
            ? Location.fromJson(json['location'])
            : null,
        current:
            json['current'] != null ? Current.fromJson(json['current']) : null,
        forecast: json['forecast'] != null
            ? Forecast.fromJson(json['forecast'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] as String?,
        region: json['region'] as String?,
        country: json['country'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        tzId: json['tz_id'] as String?,
        localtimeEpoch: json['localtime_epoch'] as int?,
        localtime: json['localtime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime,
      };
}

class Current {
  double? tempC;
  Condition? condition;
  double? windKph;
  int? humidity;
  double? feelslikeC;
  int? clouds;
  double? uv;
  Current({
    this.tempC,
    this.condition,
    this.windKph,
    this.humidity,
    this.feelslikeC,
    this.clouds,
    this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: (json['temp_c'] as num?)?.toDouble(),
        condition: json['condition'] != null
            ? Condition.fromJson(json['condition'])
            : null,
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
        clouds: json['cloud'] as int?,
        uv: (json['uv'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'temp_c': tempC,
        'condition': condition?.toJson(),
        'wind_kph': windKph,
        'humidity': humidity,
        'feelslike_c': feelslikeC,
      };
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      var forecastDaysJson = json['forecastday'] as List;
      List<Forecastday> forecastDaysList =
          forecastDaysJson.map((e) => Forecastday.fromJson(e)).toList();
      return Forecast(forecastday: forecastDaysList);
    } else {
      return Forecast(forecastday: []);
    }
  }

  Map<String, dynamic> toJson() => {
        'forecastday': forecastday?.map((e) => e.toJson()).toList(),
      };
}

class Forecastday {
  String? date;
  Day? day;
  List<HourElement>? hours;
  Forecastday({this.date, this.day, this.hours});

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    if (json['hour'] != null) {
      var hourElementJson = json['hour'] as List;

      List<HourElement> hourElementList =
          hourElementJson.map((e) => HourElement.fromJson(e)).toList();

      return Forecastday(
          date: json['date'] as String?,
          day: json['day'] != null ? Day.fromJson(json['day']) : null,
          hours: hourElementList);
    } else {
      return Forecastday(
        date: json['date'] as String?,
        day: json['day'] != null ? Day.fromJson(json['day']) : null,
        hours: [],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'day': day?.toJson(),
      };
}

class Day {
  double? maxtempC;
  double? mintempC;
  Condition? condition;

  Day({this.maxtempC, this.mintempC, this.condition});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
        mintempC: (json['mintemp_c'] as num?)?.toDouble(),
        condition: json['condition'] != null
            ? Condition.fromJson(json['condition'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'mintemp_c': mintempC,
        'condition': condition?.toJson(),
      };
}

class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
      };
}

class Hour {
  List<HourElement> hour;

  Hour({
    required this.hour,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        hour: List<HourElement>.from(
            json["hour"].map((x) => HourElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
      };
}

class HourElement {
  int timeEpoch;
  String time;
  double tempC;
  int isDay;
  Condition condition;
  double windKph;
  int windDegree;
  String windDir;
  int humidity;
  int cloud;
  double feelslikeC;
  double windchillC;
  double heatindexC;
  double dewpointC;
  int willItRain;
  int chanceOfRain;
  int willItSnow;
  int chanceOfSnow;

  HourElement({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.windchillC,
    required this.heatindexC,
    required this.dewpointC,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
  });

  factory HourElement.fromJson(Map<String, dynamic> json) => HourElement(
        timeEpoch: json["time_epoch"],
        time: json["time"],
        tempC: json["temp_c"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        windchillC: json["windchill_c"]?.toDouble(),
        heatindexC: json["heatindex_c"]?.toDouble(),
        dewpointC: json["dewpoint_c"]?.toDouble(),
        willItRain: json["will_it_rain"],
        chanceOfRain: json["chance_of_rain"],
        willItSnow: json["will_it_snow"],
        chanceOfSnow: json["chance_of_snow"],
      );

  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "windchill_c": windchillC,
        "heatindex_c": heatindexC,
        "dewpoint_c": dewpointC,
        "will_it_rain": willItRain,
        "chance_of_rain": chanceOfRain,
        "will_it_snow": willItSnow,
        "chance_of_snow": chanceOfSnow,
      };
}

class Search {
  int id;
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String url;

  Search({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "url": url,
      };
}
