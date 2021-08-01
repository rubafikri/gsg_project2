class Herb {
  String name;
  String ingrediants;
  String prepation;
  String shortDiscription;
  bool isFav = false;
  int id;

  Herb(
      {this.name,
      this.ingrediants,
      this.prepation,
      this.shortDiscription,
      this.isFav = false,
      this.id});

  Herb.fromMap(Map map) {
    this.name = map['name'];
    this.ingrediants = map['ingrediants'];
    this.prepation = map['prepation'];
    this.shortDiscription = map['shortDiscription'];
    this.isFav = map['isFav'] == 1 ? true : false;

    this.id = map['id'];
  }
  Map toMap() {
    return {
      'name': this.name,
      'ingrediants': this.ingrediants,
      'prepation': this.prepation,
      'shortDiscription': this.shortDiscription,
      'isFav': this.isFav,
      'id': this.id,
    };
  }
}
