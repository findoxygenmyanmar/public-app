import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:o2findermyanmar/network/api_service.dart';
import 'package:o2findermyanmar/network/model/services_data.dart';
import 'package:o2findermyanmar/network/model/services_model.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(ServicesInitial());
  ApiService apiService = ApiService();
  @override
  Stream<ServicesState> mapEventToState(
    ServicesEvent event,
  ) async* {
    var currentState = state;

//    if(event is ChangeCategoryKeyword){
//      yield InitialProductByCatState();
//    }
    if (event is ChangeServicesKeyword) {
//      print("CHANGECAnD");
      yield ServicesInitial();
    }
    if (event is RefreshServices) {
      yield ServicesInitial();
    } else if (event is ShowServicesLoading) {
      yield ServicesLoading();
    }

    if (event is GetServices) {
      yield* mapEventServices(event, currentState);
    }
  }

  Stream<ServicesState> mapEventServices(
      ServicesEvent event, ServicesState currentState) async* {
    final currentState = state;
    if (event is GetServices) {
      try {
        int pageToFetch = 1;
        List<ServicesData> servicesModel = [];

        if (currentState is ServicesInitial) {
          pageToFetch = 1;
          servicesModel.clear();
        }

        if (currentState is ServicesLoaded) {
          pageToFetch = currentState.page! + 1;
          print("PGTF" + pageToFetch.toString());
          servicesModel = currentState.services!;
        } else {
          pageToFetch = 1;
          servicesModel = [];
        }

        ServicesModel allServicesModel = await apiService.getServices(
            event.divisionId!, event.townshipId!, pageToFetch);

        var genericApi = allServicesModel;
        var newList = servicesModel + genericApi.data!;

        bool hasReachMax = allServicesModel.meta!.currentPage >=
                allServicesModel.meta!.lastPage
            ? false
            : true;
        servicesModel.addAll(allServicesModel.data!);

        yield ServicesLoaded(
            services: newList, page: pageToFetch, loadNoMore: hasReachMax);
      } catch (e) {
        print("ServiceError" + e.toString());
        ServicesError(error: e.toString());
      }
    }
  }

  @override
  // TODO: implement initialState
  ServicesState get initialState => ServicesInitial();

  bool _hasReachedMax(ServicesState state) =>
      state is ServicesLoaded && state.loadNoMore!;
}
