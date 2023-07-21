import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/cubit/cart_state.dart';

import '../cubit/cart_cubit.dart';
import '../widget/product_card_widget.dart';
import '../widget/product_cart_widget.dart';

class ViewCartPage extends StatefulWidget {
  const ViewCartPage({super.key});

  @override
  State<ViewCartPage> createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  late final CartCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CartCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    SizedBox.fromSize(
                      size: Size(36, 36),
                      child: ClipOval(
                        child: Material(
                          color: Colors.grey.shade200,
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back_ios_new),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'View Cart',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is InitialCartState) {
                    return Center(
                      child: Text('There aren\'t items in the cart.'),
                    );
                  }
                  if (state is LoadingCartState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is LoadedCartState) {
                    if (cubit.items.length > 0) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cubit.items.length,
                        itemBuilder: (_, index) {
                          return Dismissible(
                            key: Key(cubit.items[index]),
                            background: Container(color: Colors.red),
                            child: ProductCartWidget(),
                            onDismissed: (direction) {
                              setState(() {
                                this.cubit.removeItemCart(index: index);
                              });
                            },
                          );
                        },
                      );
                    }
                    return Center(
                      child: Text('There aren\'t items in the cart.'),
                    );
                  }
                  return ProductCartWidget();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 185,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$190.00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$3.00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Free',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                DottedLine(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$193.00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
