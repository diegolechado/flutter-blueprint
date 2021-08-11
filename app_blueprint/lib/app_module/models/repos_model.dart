import 'dart:convert';

class ReposModel {
  final String name;
  final String description;
  final String fullName;
  final int watchers;
  final int forks;

  const ReposModel({
    required this.name,
    required this.description,
    required this.fullName,
    required this.watchers,
    required this.forks});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'full_name': fullName,
      'watchers': watchers,
      'forks': forks,
    };
  }

  static ReposModel fromMap(Map<String, dynamic> map) {
      return ReposModel(
        name: map['name'],
        description: map['description'],
        fullName: map['full_name'],
        forks: map['forks'],
        watchers: map['watchers'],
      );
  }

  String toJson() => json.encode(toMap());

  static ReposModel fromJson(String source) => fromMap(json.decode(source));
}