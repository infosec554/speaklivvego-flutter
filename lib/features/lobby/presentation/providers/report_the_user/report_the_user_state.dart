part of 'report_the_user_provider.dart';

class ReportTheUserState extends Equatable {
  const ReportTheUserState({
    this.selectedReasons = const [],
    this.report = '',
  });

  ReportTheUserState copyWith({
    List<String>? selectedReasons,
    String? report,
  }) => ReportTheUserState(
    selectedReasons: selectedReasons ?? this.selectedReasons,
    report: report ?? this.report,
  );

  final List<String> selectedReasons;
  final String report;

  @override
  List<Object?> get props => [
    selectedReasons,
    report,
  ];

  bool get canReport => report.isNotEmpty && selectedReasons.isNotEmpty;
}
