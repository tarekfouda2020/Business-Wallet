import 'package:base_flutter/company/models/dots/LocationModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  onLocationUpdated(LocationModel model,{bool? change}){
    emit(LocationUpdated(model, change));
  }

}
