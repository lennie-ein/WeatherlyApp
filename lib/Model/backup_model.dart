// class WeatherModel {
//   late City city;
//   late String cod;
//   late double message;
//   late int cnt;
//   dynamic list;
//
//   WeatherModel(
//       {required this.city, required this.cod, required this.message, required this.cnt, required this.list});
//
//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     city = (json['city'] != null ? new City.fromJson(json['city']) : null)!;
//     cod = json['cod'];
//     message = json['message'].toDouble();
//     cnt = json['cnt'];
//     if (json['list'] != null) {
//       list = <List>[];
//       json['list'].forEach((v) {
//         list.add(new Lista.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.city != null) {
//       data['city'] = this.city.toJson();
//     }
//     data['cod'] = this.cod;
//     data['message'] = this.message;
//     data['cnt'] = this.cnt;
//     if (this.list != null) {
//       data['list'] = this.list.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class City {
//   late int id;
//   late String name;
//   late Coord coord;
//   late String country;
//   late int population;
//   late int timezone;
//
//   City(
//       {required this.id,
//         required this.name,
//         required this.coord,
//         required this.country,
//         required this.population,
//         required this.timezone});
//
//   City.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     coord = (json['coord'] != null ? new Coord.fromJson(json['coord']) : null)!;
//     country = json['country'];
//     population = json['population'];
//     timezone = json['timezone'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.coord != null) {
//       data['coord'] = this.coord.toJson();
//     }
//     data['country'] = this.country;
//     data['population'] = this.population;
//     data['timezone'] = this.timezone;
//     return data;
//   }
// }
//
// class Coord {
//   late double lon;
//   late double lat;
//
//   Coord({required this.lon, required this.lat});
//
//   Coord.fromJson(Map<String, dynamic> json) {
//     lon = json['lon'].toDouble();
//     lat = json['lat'].toDouble();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lon'] = this.lon;
//     data['lat'] = this.lat;
//     return data;
//   }
// }
//
// class List {
//   late int dt;
//   late Main main;
//   dynamic weather;
//   late Clouds clouds;
//   late Wind wind;
//   late int visibility;
//   late double pop;
//   late Sys sys;
//   late String dtTxt;
//   late Rain rain;
//
//   List(
//       {required this.dt,
//         required this.main,
//         required this.weather,
//         required this.clouds,
//         required this.wind,
//         required this.visibility,
//         required this.pop,
//         required this.sys,
//         required this.dtTxt,
//         required this.rain});
//
//   List.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     main = (json['main'] = Main.fromJson(json['main']));
//
//     weather = <Weather>[];
//     json['weather'].forEach((v) {
//       weather?.add(Weather.fromJson(v));
//     });
//
//     clouds = (json['clouds'] = Clouds.fromJson(json['clouds']));
//     wind = (json['wind'] = Wind.fromJson(json['wind']));
//     visibility = json['visibility'];
//     pop = json['pop'].toDouble();
//     sys = (json['sys'] = Sys.fromJson(json['sys']));
//     dtTxt = json['dt_txt'];
//     rain = (json['rain'] = Rain.fromJson(json['rain']));
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['dt'] = dt;
//     data['main'] = main.toJson();
//
//     data['weather'] = weather?.map((v) => v.toJson()).toList();
//
//     data['clouds'] = clouds.toJson();
//     data['wind'] = wind.toJson();
//     data['visibility'] = visibility;
//     data['pop'] = pop;
//     data['sys'] = sys.toJson();
//     data['dt_txt'] = dtTxt;
//     data['rain'] = rain.toJson();
//     return data;
//   }
// }
//
// class Temp {
//   late double day;
//   late double min;
//   late double max;
//   late double night;
//   late double eve;
//   late double morn;
//
//   Temp({required this.day, required this.min, required this.max, required this.night, required this.eve, required this.morn});
//
//   Temp.fromJson(Map<String, dynamic> json) {
//     day = json['day'].toDouble();
//     min = json['min'].toDouble();
//     max = json['max'].toDouble();
//     night = json['night'].toDouble();
//     eve = json['eve'].toDouble();
//     morn = json['morn'].toDouble();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     data['min'] = this.min;
//     data['max'] = this.max;
//     data['night'] = this.night;
//     data['eve'] = this.eve;
//     data['morn'] = this.morn;
//     return data;
//   }
// }
//
// class FeelsLike {
//   late double day;
//   late double night;
//   late double eve;
//   late double morn;
//
//   FeelsLike({required this.day, required this.night, required this.eve, required this.morn});
//
//   FeelsLike.fromJson(Map<String, dynamic> json) {
//     day = json['day'].toDouble();
//     night = json['night'].toDouble();
//     eve = json['eve'].toDouble();
//     morn = json['morn'].toDouble();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     data['night'] = this.night;
//     data['eve'] = this.eve;
//     data['morn'] = this.morn;
//     return data;
//   }
// }
//
// class Weather {
//   late int id;
//   late String main;
//   late String description;
//   late String icon;
//
//   Weather({required this.id, required this.main, required this.description, required this.icon});
//
//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['main'] = this.main;
//     data['description'] = this.description;
//     data['icon'] = this.icon;
//     return data;
//   }
// }