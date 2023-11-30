part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState(
      {this.isLoading = false,
      this.sortBy = 'Number',
      this.allPokemonsNames = const [],
      this.pokemonsList = const []});
  const DashboardState.init() : this();

  final bool isLoading;
  final List<Pokemon> pokemonsList;
  final List<dynamic> allPokemonsNames;
  final String sortBy;

  DashboardState copyWith(
      {bool? isLoading,
      bool? isLoadingMore,
      List<Pokemon>? pokemonsList,
      List<dynamic>? allPokemonsNames,
      String? sortBy}) {
    return DashboardState(
        allPokemonsNames: allPokemonsNames ?? this.allPokemonsNames,
        isLoading: isLoading ?? this.isLoading,
        sortBy: sortBy ?? this.sortBy,
        pokemonsList: pokemonsList ?? this.pokemonsList);
  }

  @override
  List<Object> get props => [isLoading, allPokemonsNames, pokemonsList, sortBy];
}
