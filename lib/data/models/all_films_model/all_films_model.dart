class AllFilmsModel {
  Data? data;

  AllFilmsModel({this.data});

  AllFilmsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  AllFilms? allFilms;

  Data({this.allFilms});

  Data.fromJson(Map<String, dynamic> json) {
    allFilms = json['allFilms'] != null
        ? new AllFilms.fromJson(json['allFilms'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allFilms != null) {
      data['allFilms'] = this.allFilms!.toJson();
    }
    return data;
  }
}

class AllFilms {
  List<Films>? films;

  AllFilms({this.films});

  AllFilms.fromJson(Map<String, dynamic> json) {
    if (json['films'] != null) {
      films = <Films>[];
      json['films'].forEach((v) {
        films!.add(new Films.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.films != null) {
      data['films'] = this.films!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Films {
  String? title;
  String? director;
  String? releaseDate;
  SpeciesConnection? speciesConnection;

  Films({this.title, this.director, this.releaseDate, this.speciesConnection});

  Films.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    director = json['director'];
    releaseDate = json['releaseDate'];
    speciesConnection = json['speciesConnection'] != null
        ? new SpeciesConnection.fromJson(json['speciesConnection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['director'] = this.director;
    data['releaseDate'] = this.releaseDate;
    if (this.speciesConnection != null) {
      data['speciesConnection'] = this.speciesConnection!.toJson();
    }
    return data;
  }
}

class SpeciesConnection {
  List<Species>? species;

  SpeciesConnection({this.species});

  SpeciesConnection.fromJson(Map<String, dynamic> json) {
    if (json['species'] != null) {
      species = <Species>[];
      json['species'].forEach((v) {
        species!.add(new Species.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.species != null) {
      data['species'] = this.species!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Species {
  String? name;
  String? classification;
  Homeworld? homeworld;

  Species({this.name, this.classification, this.homeworld});

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    classification = json['classification'];
    homeworld = json['homeworld'] != null
        ? new Homeworld.fromJson(json['homeworld'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['classification'] = this.classification;
    if (this.homeworld != null) {
      data['homeworld'] = this.homeworld!.toJson();
    }
    return data;
  }
}

class Homeworld {
  String? name;

  Homeworld({this.name});

  Homeworld.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
