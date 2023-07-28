// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_search_cubit.dart';

//todo 1 (next todo_search_cubit.dart)
class TodoSearchState extends Equatable {
  final String searchTerm;
  const TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [searchTerm];
}
