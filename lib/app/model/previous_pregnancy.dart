class PreviousPregnancy {
  final int id;
  final int? pregnancyNumber;
  final int? givenBirthNumber;
  final int? abortionsNumber;
  final String? createdAt;

  const PreviousPregnancy({
    required this.id,
    this.pregnancyNumber,
    this.givenBirthNumber,
    this.abortionsNumber,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pregnancy_number': pregnancyNumber,
      'given_birth_number': givenBirthNumber,
      'abortions_number': abortionsNumber,
      'created_at': createdAt,
    };
  }

  factory PreviousPregnancy.fromMap(Map<String, dynamic> map) {
    return PreviousPregnancy(
      id: map['id'] ?? 0,
      pregnancyNumber: map['pregnancy_number'],
      givenBirthNumber: map['given_birth_number'],
      abortionsNumber: map['abortions_number'],
      createdAt: map['created_at'],
    );
  }

  PreviousPregnancy copyWith({
    int? id,
    int? pregnancyNumber,
    int? givenBirthNumber,
    int? abortionsNumber,
    String? createdAt,
  }) {
    return PreviousPregnancy(
      id: id ?? this.id,
      pregnancyNumber: pregnancyNumber ?? this.pregnancyNumber,
      givenBirthNumber: givenBirthNumber ?? this.givenBirthNumber,
      abortionsNumber: abortionsNumber ?? this.abortionsNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'PreviousPregnancy(id: $id, pregnancyNumber: $pregnancyNumber, givenBirthNumber: $givenBirthNumber, abortionsNumber: $abortionsNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PreviousPregnancy &&
        other.id == id &&
        other.pregnancyNumber == pregnancyNumber &&
        other.givenBirthNumber == givenBirthNumber &&
        other.abortionsNumber == abortionsNumber &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pregnancyNumber.hashCode ^
        givenBirthNumber.hashCode ^
        abortionsNumber.hashCode ^
        createdAt.hashCode;
  }
}

