part of 'services_bloc.dart';

@immutable
abstract class ServicesState {
  const ServicesState();
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  List<ServicesData>? services;
  final int? page;
  final bool? loadNoMore;

  ServicesLoaded({this.services, this.page, this.loadNoMore});

  @override
  String toString() =>
      'ServicesLoaded { events: ${services?.length}, loadNoMore: $loadNoMore }';
}

class ServicesError extends ServicesState {
  final String? error;

  ServicesError({this.error});
}
