import 'package:flutter/material.dart';

class ItemSelectorWidget extends StatelessWidget {
  final String title;
  const ItemSelectorWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(title, style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
