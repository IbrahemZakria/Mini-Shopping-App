import 'package:mini_shopping_app/core/helper/services/api_servises.dart';
import 'package:mini_shopping_app/features/product/data/datasources/remote_data_source.dart/remote_data_sourse.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';

class RemoteDataSourseImpel extends RemoteDataSourse {
  final ApiServises _apiServises;

  RemoteDataSourseImpel(this._apiServises);

  @override
  Future<List<ProductModel>> getAllProduct() async {
    var response = await _apiServises.getData("products");
    List<ProductModel> products = [];
    for (var item in response) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}
