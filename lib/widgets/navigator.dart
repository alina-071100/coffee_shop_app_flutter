import 'package:coffee_shop_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class TestTest extends StatefulWidget {
  const TestTest({super.key});

  @override
  State<TestTest> createState() => _TestTestState();
}

class _TestTestState extends State<TestTest> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomBar(),
    );
  }
}
