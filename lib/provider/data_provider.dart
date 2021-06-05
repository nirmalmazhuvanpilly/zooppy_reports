import 'package:flutter/foundation.dart';
import 'package:webandcrafts_coding_test/model/datamodel.dart';
import 'package:webandcrafts_coding_test/services/api_services.dart';

class DataProvider with ChangeNotifier {
  ApiServices _apiServices = ApiServices();
  DataModelList _dataModel = DataModelList();

  DataModelList get dataModel => _dataModel;

  set dataModel(DataModelList dataModel) {
    _dataModel = dataModel;
    notifyListeners();
  }

  List<DataModel> search = [];
  List<DataModel> searchResult = [];

  Future<void> fetchData() async {
    dataModel = await _apiServices.fetchDetails();
    search.addAll(dataModel.dataModel);
    notifyListeners();
  }

  Future<void> searchData(text) async {
    searchResult.clear();
    if (text.isEmpty) {
      searchResult.clear();
    }
    search.forEach((element) {
      if (element.name.contains(text)) {
        searchResult.add(element);
      }
    });

    notifyListeners();
  }
}
