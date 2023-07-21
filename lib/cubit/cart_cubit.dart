import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<String> _items = [];
  List<String> get items => _items;
  CartCubit() : super(InitialCartState());

  Future<void> addItemCart({required String item}) async {
    emit(LoadingCartState());
    await Future.delayed(const Duration(seconds: 1));
    _items.add(item);
    emit(LoadedCartState(_items));
  }

  Future<void> removeItemCart({required int index}) async {
    emit(LoadingCartState());
    await Future.delayed(const Duration(seconds: 1));
    _items.removeAt(index);
    emit(LoadedCartState(_items));
  }
}
