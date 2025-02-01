class CountryModel {
  Name? name;
  List<dynamic>? tld;
  List<dynamic>? capital;
  String? region;
  Languages? languages;
  bool? landlocked;
  List<dynamic>? borders;
  String? flag;
  int? population;

  CountryModel(
      {this.name,
      this.tld,
      this.capital,
      this.region,
      this.languages,
      this.landlocked,
      this.borders,
      this.flag,
      this.population});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    region = json['region'];
    languages = json['languages'] != null ? Languages.fromJson(json['languages']) : null;
    landlocked = json['landlocked'];
    flag = json['flag'];
    population = json['population'];
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null ? NativeName.fromJson(json['nativeName']) : null;
  }
}

class NativeName {
  Tur? tur;

  NativeName({this.tur});

  NativeName.fromJson(Map<String, dynamic> json) {
    tur = json['tur'] != null ? new Tur.fromJson(json['tur']) : null;
  }
}

class Tur {
  String? official;
  String? common;

  Tur({this.official, this.common});

  Tur.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }
}

class Languages {
  String? tur;

  Languages({this.tur});

  Languages.fromJson(Map<String, dynamic> json) {
    tur = json['tur'];
  }
}
