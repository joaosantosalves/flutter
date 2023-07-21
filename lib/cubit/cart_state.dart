abstract class CartState {}

class InitialCartState extends CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<String> cart;

  LoadedCartState(this.cart);
}

class ErrorCartState extends CartState {
  final String message;
  ErrorCartState(this.message);
}
