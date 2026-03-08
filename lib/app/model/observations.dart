class Observations {
  final int id;
  final String observations;
  final String? createdAt;

  const Observations({
    required this.id,
    required this.observations,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'observations': observations,
      'created_at': createdAt,
    };
  }

  factory Observations.fromMap(Map<String, dynamic> map) {
    return Observations(
      id: map['id'] ?? 0,
      observations: map['observations'] ?? '',
      createdAt: map['created_at'],
    );
  }

  Observations copyWith({
    int? id,
    String? observations,
    String? createdAt,
  }) {
    return Observations(
      id: id ?? this.id,
      observations: observations ?? this.observations,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'Observations(id: $id, observations: $observations, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Observations &&
        other.id == id &&
        other.observations == observations &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ observations.hashCode ^ createdAt.hashCode;
  }
}

