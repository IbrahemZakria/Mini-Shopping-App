part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductSuccesState extends ProductState {
  final List<ProductModel> products;
  const ProductSuccesState({required this.products});
}

class ProductLoadingState extends ProductState {}

class ProductFailesState extends ProductState {
  final String errorMessage;

  const ProductFailesState({required this.errorMessage});
}
