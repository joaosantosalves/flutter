import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/cubit/cart_cubit.dart';
import 'package:grocery/cubit/cart_state.dart';
import 'package:grocery/page/view_cart_page.dart';

import '../widget/banner_widget.dart';
import '../widget/item_selector_widget.dart';
import '../widget/product_card_widget.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12.0,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewCartPage(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.shopping_bag,
                              color: Colors.lightGreen,
                              size: 72,
                            ),
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            size: 36,
                          ),
                          Text(
                            '2972 Westheimer Rd.',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 48.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset('assets/images/char.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  labelText: 'Search',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 36,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            BannerWidget(
                                'Cold Process Organic',
                                'Savon Stories',
                                'BUY 1 GET 1 FREE',
                                'assets/images/straw.png'),
                            BannerWidget(
                                'Cold Process Organic',
                                'Savon Stories',
                                'BUY 1 GET 1 FREE',
                                'assets/images/straw.png'),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              ItemSelectorWidget('All'),
                              ItemSelectorWidget('Vegetables'),
                              ItemSelectorWidget('Fruits'),
                              ItemSelectorWidget('Juices'),
                              ItemSelectorWidget('Breads'),
                              ItemSelectorWidget('Soda'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Irresistible Offer',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "YourRoute");
                              },
                              child: new Padding(
                                padding: new EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "See All",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.green, size: 16)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ProductCardWidget(),
                                ProductCardWidget(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ProductCardWidget(),
                                ProductCardWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
