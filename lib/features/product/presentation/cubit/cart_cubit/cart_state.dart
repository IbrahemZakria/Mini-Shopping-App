part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductEntity> products;

  const CartSuccessState({required this.products});
}

class CartLoadingState extends CartState {}

class CartFailedState extends CartState {}
