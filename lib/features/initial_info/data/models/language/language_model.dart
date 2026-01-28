import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  const LanguageModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [
    id,
    name,
  ];
}
