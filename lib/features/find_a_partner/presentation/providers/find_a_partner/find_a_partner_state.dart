part of 'find_a_partner_provider.dart';

class FindAPartnerState extends Equatable {
  const FindAPartnerState({
    required this.duration,
  });

  FindAPartnerState copyWith({
    int? duration,
  }) => FindAPartnerState(
    duration: duration ?? this.duration,
  );

  final int duration;

  @override
  List<Object?> get props => [
    duration,
  ];
}
