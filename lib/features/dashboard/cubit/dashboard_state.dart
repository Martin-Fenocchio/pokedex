part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState({this.isLoading = false, this.pokemonsList = const []});
  const DashboardState.init() : this();

  final bool isLoading;
  final List<Pokemon> pokemonsList;

  DashboardState copyWith({bool? isLoading, List<Pokemon>? pokemonsList}) {
    return DashboardState(
        isLoading: isLoading ?? this.isLoading,
        pokemonsList: pokemonsList ?? this.pokemonsList);
  }

  @override
  List<Object> get props => [isLoading, pokemonsList];
}
