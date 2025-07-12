import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';
import 'package:mini_shopping_app/features/product/data/repositories/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productrepo) : super(ProductInitial());

  final ProductRepo productrepo;
  List<ProductModel> cart = [];
  Future getAllProduct() async {
    emit(ProductLoadingState());
    var result = await productrepo.getAllProduct();
    result.fold(
      (failure) {
        emit(ProductFailesState(errorMessage: failure.errorMessage));
      },
      (product) {
        emit(ProductSuccesState(products: product));
      },
    );
  }
}
