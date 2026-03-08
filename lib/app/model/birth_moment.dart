enum BirthWay { vaginal, cesarean, dontKnow }

enum Anesthesia { yes, no, dontKnow }

enum VaginalCut { yes, no, dontKnow }

enum Positions {
  lyingDown,
  sitting,
  crouched,
  aside,
  onKnees,
  standing,
  dontKnow,
  otherPosition,
}

class BirthMoment {
  final int id;
  final BirthWay birthWay;
  final Anesthesia anesthesia;
  final VaginalCut vaginalCut;
  final Positions? preferredPosition;
  final String? otherPosition;
  final String? createdAt;

  const BirthMoment({
    required this.id,
    required this.birthWay,
    required this.anesthesia,
    required this.vaginalCut,
    this.preferredPosition,
    this.otherPosition,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'birth_way': birthWay.index,
      'anesthesia': anesthesia.index,
      'vaginal_cut': vaginalCut.index,
      'preferred_position': preferredPosition?.index,
      'other_position': otherPosition,
      'created_at': createdAt,
    };
  }

  factory BirthMoment.fromMap(Map<String, dynamic> map) {
    return BirthMoment(
      id: map['id'] ?? 0,
      birthWay: BirthWay.values[map['birth_way'] ?? 0],
      anesthesia: Anesthesia.values[map['anesthesia'] ?? 0],
      vaginalCut: VaginalCut.values[map['vaginal_cut'] ?? 0],
      preferredPosition: map['preferred_position'] != null 
          ? Positions.values[map['preferred_position']] 
          : null,
      otherPosition: map['other_position'],
      createdAt: map['created_at'],
    );
  }

  BirthMoment copyWith({
    int? id,
    BirthWay? birthWay,
    Anesthesia? anesthesia,
    VaginalCut? vaginalCut,
    Positions? preferredPosition,
    String? otherPosition,
    String? createdAt,
  }) {
    return BirthMoment(
      id: id ?? this.id,
      birthWay: birthWay ?? this.birthWay,
      anesthesia: anesthesia ?? this.anesthesia,
      vaginalCut: vaginalCut ?? this.vaginalCut,
      preferredPosition: preferredPosition ?? this.preferredPosition,
      otherPosition: otherPosition ?? this.otherPosition,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'BirthMoment(id: $id, birthWay: $birthWay, anesthesia: $anesthesia, vaginalCut: $vaginalCut, preferredPosition: $preferredPosition, otherPosition: $otherPosition, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BirthMoment &&
        other.id == id &&
        other.birthWay == birthWay &&
        other.anesthesia == anesthesia &&
        other.vaginalCut == vaginalCut &&
        other.preferredPosition == preferredPosition &&
        other.otherPosition == otherPosition &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        birthWay.hashCode ^
        anesthesia.hashCode ^
        vaginalCut.hashCode ^
        preferredPosition.hashCode ^
        otherPosition.hashCode ^
        createdAt.hashCode;
  }
}

