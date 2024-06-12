part of 'main_cubit.dart';

class MainState extends Equatable {
  final int currentIndex;
  final bool isExtended;
  const MainState({required this.currentIndex,required this.isExtended});

  @override
  List<Object?> get props => [currentIndex, isExtended];

}