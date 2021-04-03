import 'package:pagination/category/model/category_response.dart';
import 'package:pagination/category/services/category_api_provider.dart';

class RepositoryCategory {
  static final RepositoryCategory _singleton = RepositoryCategory._internal();

  factory RepositoryCategory() {
    return _singleton;
  }

  RepositoryCategory._internal();

  ProductApiProvider _productApiProvider = ProductApiProvider();

  Future<CategoryResponse> category(String id, String device, String model,
      String token, int page)async{
    return await _productApiProvider.categoryUpdate(id,device,model,token,page);
  }

}