part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  PostsLoaded({required this.response});

  final List<PostsModel?> response;
}

class PostsError extends PostsState {
  PostsError({required this.error});

  final String error;
}
