/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Dob {
  String? date;
  int? age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['age'] = age;
    return data;
  }
}

class Id {
  String? name;
  String? value;

  Id({this.name, this.value});

  Id.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class Info {
  String? seed;
  int? results;
  int? page;
  String? version;

  Info({this.seed, this.results, this.page, this.version});

  Info.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    results = json['results'];
    page = json['page'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['seed'] = seed;
    data['results'] = results;
    data['page'] = page;
    data['version'] = version;
    return data;
  }
}

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  String? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  Location({this.street, this.city, this.state, this.country, this.postcode, this.coordinates, this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street = json['street'] != null ? Street?.fromJson(json['street']) : null;
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postcode = (json['postcode']).toString();
    coordinates = json['coordinates'] != null ? Coordinates?.fromJson(json['coordinates']) : null;
    timezone = json['timezone'] != null ? Timezone?.fromJson(json['timezone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['street'] = street!.toJson();
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postcode'] = postcode;
    data['coordinates'] = coordinates!.toJson();
    data['timezone'] = timezone!.toJson();
    return data;
  }
}

class Login {
  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  Login({this.uuid, this.username, this.password, this.salt, this.md5, this.sha1, this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    username = json['username'];
    password = json['password'];
    salt = json['salt'];
    md5 = json['md5'];
    sha1 = json['sha1'];
    sha256 = json['sha256'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uuid'] = uuid;
    data['username'] = username;
    data['password'] = password;
    data['salt'] = salt;
    data['md5'] = md5;
    data['sha1'] = sha1;
    data['sha256'] = sha256;
    return data;
  }
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class Registered {
  String? date;
  int? age;

  Registered({this.date, this.age});

  Registered.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['age'] = age;
    return data;
  }
}

class Result {
  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Registered? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  Result({this.gender, this.name, this.location, this.email, this.login, this.dob, this.registered, this.phone, this.cell, this.id, this.picture, this.nat});

  Result.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? Name?.fromJson(json['name']) : null;
    location = json['location'] != null ? Location?.fromJson(json['location']) : null;
    email = json['email'];
    login = json['login'] != null ? Login?.fromJson(json['login']) : null;
    dob = json['dob'] != null ? Dob?.fromJson(json['dob']) : null;
    registered = json['registered'] != null ? Registered?.fromJson(json['registered']) : null;
    phone = json['phone'];
    cell = json['cell'];
    id = json['id'] != null ? Id?.fromJson(json['id']) : null;
    picture = json['picture'] != null ? Picture?.fromJson(json['picture']) : null;
    nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gender'] = gender;
    data['name'] = name!.toJson();
    data['location'] = location!.toJson();
    data['email'] = email;
    data['login'] = login!.toJson();
    data['dob'] = dob!.toJson();
    data['registered'] = registered!.toJson();
    data['phone'] = phone;
    data['cell'] = cell;
    data['id'] = id!.toJson();
    data['picture'] = picture!.toJson();
    data['nat'] = nat;
    return data;
  }
}

class Root {
  List<Result?>? results;
  Info? info;

  Root({this.results, this.info});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
    info = json['info'] != null ? Info?.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['results'] =results != null ? results!.map((v) => v?.toJson()).toList() : null;
    data['info'] = info!.toJson();
    return data;
  }
}

class Street {
  int? number;
  String? name;

  Street({this.number, this.name});

  Street.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = number;
    data['name'] = name;
    return data;
  }
}

class Timezone {
  String? offset;
  String? description;

  Timezone({this.offset, this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['offset'] = offset;
    data['description'] = description;
    return data;
  }
}


class Movie {
  String? id;
  String? tMDBID;
  String? name;
  String? description;
  String? genres;
  String? releasedate;
  String? runtime;
  String? poster;
  String? banner;
  String? youtubetrailer;
  String? downloadable;
  String? type;
  String? status;
  String? contenttype;

  Movie({this.id, this.tMDBID, this.name, this.description, this.genres, this.releasedate, this.runtime, this.poster, this.banner, this.youtubetrailer, this.downloadable, this.type, this.status, this.contenttype});

  Movie.fromJson(dynamic json) {
    id = json['id'];
    tMDBID = json['TMDB_ID'];
    name = json['name'];
    description = json['description'];
    genres = json['genres'];
    releasedate = json['release_date'];
    runtime = json['runtime'];
    poster = json['poster'];
    banner = json['banner'];
    youtubetrailer = json['youtube_trailer'];
    downloadable = json['downloadable'];
    type = json['type'];
    status = json['status'];
    contenttype = json['content_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['TMDB_ID'] = tMDBID;
    data['name'] = name;
    data['description'] = description;
    data['genres'] = genres;
    data['release_date'] = releasedate;
    data['runtime'] = runtime;
    data['poster'] = poster;
    data['banner'] = banner;
    data['youtube_trailer'] = youtubetrailer;
    data['downloadable'] = downloadable;
    data['type'] = type;
    data['status'] = status;
    data['content_type'] = contenttype;
    return data;
  }
}


