import 'package:flutter_application/core/network/api_errorr_handler.dart';
import 'package:flutter_application/features/home/data/model/specializations_response_model.dart';
import 'package:flutter_application/features/home/data/repo/home_repo.dart';
import 'package:flutter_application/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsDataList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (specializationsResponseModel) {
        specializationsDataList =
            specializationsResponseModel.specializationDataList;
        getDoctorsList(specID: specializationsDataList?.first?.id);
        emit(HomeState.specializationsSuccess(specializationsDataList));
      },
      failure: (apiErrorModel) {
        emit(HomeState.specializationsError(apiErrorModel));
      },
    );
  }

  void getDoctorsList({required int? specID}) {
    List<DoctorsModel>? doctorList = filterSpecializationsByID(specID);
    if(doctorList != null && doctorList.isNotEmpty){
      emit(HomeState.doctorsSuccess(doctorList));
    }
    else{
      emit(const HomeState.doctorsError());
    }
  }

  filterSpecializationsByID(specID) {
    return specializationsDataList?.firstWhere((specialization) => specialization?.id == specID ,
    )?.doctorModel;
  }

}
