import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/profile/data/models/profile/profile_model.dart';
import 'package:speak_live_go/features/profile/domain/repository_providers/profile_repository_provider.dart';

final AutoDisposeFutureProvider<ProfileModel> profileProvider =
    FutureProvider.autoDispose<ProfileModel>(
      (ref) => ref.read(profileRepositoryProvider).getProfile(),
    );
