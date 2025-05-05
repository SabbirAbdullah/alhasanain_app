import '../model/complain_model.dart';
import '../remote/complain_remote_data.dart';

class ComplainRepository {
  final ComplainRemoteData apiService = ComplainRemoteData();



  Future<bool> submitComplain(ComplainRequestModel model) async {
    return await apiService.submitComplain(model);
  }

  Future<List<ComplainViewModel>> getComplains(String phone) {
    return apiService.fetchComplains(phone);
  }
  Future<ComplainDeleteResponseModel> deleteComplain(int id) {
    return apiService.deleteComplainById(id);
  }
}
