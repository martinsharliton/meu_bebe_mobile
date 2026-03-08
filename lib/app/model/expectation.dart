enum Alternatives { yes, no, dontKnow }

class Expectation {
  final int id;
  final Alternatives companion;
  final Alternatives shaveIntimateHair;
  final Alternatives bowelWashOrSuppository;
  final Alternatives lowLightEnvironment;
  final Alternatives listenToMusic;
  final Alternatives drinkLiquids;
  final Alternatives recordPhotosOrVideos;
  final String? createdAt;

  const Expectation({
    required this.id,
    required this.companion,
    required this.shaveIntimateHair,
    required this.bowelWashOrSuppository,
    required this.lowLightEnvironment,
    required this.listenToMusic,
    required this.drinkLiquids,
    required this.recordPhotosOrVideos,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companion': companion.index,
      'shave_intimate_hair': shaveIntimateHair.index,
      'bowel_wash_or_suppository': bowelWashOrSuppository.index,
      'low_light_environment': lowLightEnvironment.index,
      'listen_to_music': listenToMusic.index,
      'drink_liquids': drinkLiquids.index,
      'record_photos_or_videos': recordPhotosOrVideos.index,
      'created_at': createdAt,
    };
  }

  factory Expectation.fromMap(Map<String, dynamic> map) {
    return Expectation(
      id: map['id'] ?? 0,
      companion: Alternatives.values[map['companion'] ?? 1],
      shaveIntimateHair: Alternatives.values[map['shave_intimate_hair'] ?? 1],
      bowelWashOrSuppository: Alternatives.values[map['bowel_wash_or_suppository'] ?? 1],
      lowLightEnvironment: Alternatives.values[map['low_light_environment'] ?? 1],
      listenToMusic: Alternatives.values[map['listen_to_music'] ?? 1],
      drinkLiquids: Alternatives.values[map['drink_liquids'] ?? 1],
      recordPhotosOrVideos: Alternatives.values[map['record_photos_or_videos'] ?? 1],
      createdAt: map['created_at'],
    );
  }

  Expectation copyWith({
    int? id,
    Alternatives? companion,
    Alternatives? shaveIntimateHair,
    Alternatives? bowelWashOrSuppository,
    Alternatives? lowLightEnvironment,
    Alternatives? listenToMusic,
    Alternatives? drinkLiquids,
    Alternatives? recordPhotosOrVideos,
    String? createdAt,
  }) {
    return Expectation(
      id: id ?? this.id,
      companion: companion ?? this.companion,
      shaveIntimateHair: shaveIntimateHair ?? this.shaveIntimateHair,
      bowelWashOrSuppository: bowelWashOrSuppository ?? this.bowelWashOrSuppository,
      lowLightEnvironment: lowLightEnvironment ?? this.lowLightEnvironment,
      listenToMusic: listenToMusic ?? this.listenToMusic,
      drinkLiquids: drinkLiquids ?? this.drinkLiquids,
      recordPhotosOrVideos: recordPhotosOrVideos ?? this.recordPhotosOrVideos,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'Expectation(id: $id, companion: $companion, shaveIntimateHair: $shaveIntimateHair, bowelWashOrSuppository: $bowelWashOrSuppository, lowLightEnvironment: $lowLightEnvironment, listenToMusic: $listenToMusic, drinkLiquids: $drinkLiquids, recordPhotosOrVideos: $recordPhotosOrVideos, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Expectation &&
        other.id == id &&
        other.companion == companion &&
        other.shaveIntimateHair == shaveIntimateHair &&
        other.bowelWashOrSuppository == bowelWashOrSuppository &&
        other.lowLightEnvironment == lowLightEnvironment &&
        other.listenToMusic == listenToMusic &&
        other.drinkLiquids == drinkLiquids &&
        other.recordPhotosOrVideos == recordPhotosOrVideos &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        companion.hashCode ^
        shaveIntimateHair.hashCode ^
        bowelWashOrSuppository.hashCode ^
        lowLightEnvironment.hashCode ^
        listenToMusic.hashCode ^
        drinkLiquids.hashCode ^
        recordPhotosOrVideos.hashCode ^
        createdAt.hashCode;
  }
}

