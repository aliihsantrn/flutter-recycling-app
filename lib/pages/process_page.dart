import 'package:flutter/material.dart';
import 'package:flutter_auth/utils/customAppbar.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(coin: 300),
      body: Center(
        child: Text("Proccess Page"),
      ),
    );
  }
}