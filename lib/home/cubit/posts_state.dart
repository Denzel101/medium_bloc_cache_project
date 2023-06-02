part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  PostsLoaded({required this.response});

  final List<PostsResponseModel?> response;
}

class PostsError extends PostsState {
  PostsError({required this.error});

  final String error;
}
