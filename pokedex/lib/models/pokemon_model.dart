class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  dynamic spawnChance;
  int? avgSpawns;
  String? spawnTime;
  List? multipliers;
  List? weaknesses;
  List? nextEvolution;
  List? preEvolution;
  Pokemon(
      {required this.id,
      required this.num,
      required this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.preEvolution,
      this.nextEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    num = json["num"];
    name = json["name"];
    img = json["img"];
    type = [];
    if (json["type"] != null) {
      json["type"].forEach((e) {
        type!.add(e);
      });
    }
    height = json["height"];
    weight = json["weight"];
    candy = json["candy"];
    candyCount = json["candy_count"];
    egg = json["egg"];
    spawnChance = json["spawn_chance"];
    spawnTime = json["spawn_time"];
    multipliers = [];

    if (json["multipliers"] != null) {
      json["multipliers"].forEach((e) {
        multipliers!.add(e);
      });
    }
    weaknesses = [];
    if (json["weaknesses"] != null) {
      json["weaknesses"].forEach((e) {
        weaknesses!.add(e);
      });
      nextEvolution = [];
      if (json["next_evolution"] != null) {
        json["next_evolution"].forEach((e) {
          nextEvolution!.add(e["name"]);
        });
     preEvolution = [];
        if (json["prev_evolution"] != null) {
          json["prev_evolution"].forEach((e) {
            preEvolution!.add(e["name"]);
          });
        }
      }
    }
  }
}
