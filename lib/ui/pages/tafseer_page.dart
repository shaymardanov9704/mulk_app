import 'package:flutter/material.dart';
import 'package:mulk_app/ui/widgets/tafser_widget.dart';

class TafseerPage extends StatelessWidget {
  const TafseerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 31,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => TafseerWidget(number: i),
      ),
    );
  }
}
