import 'package:flutter/material.dart';

class TaxButton extends StatelessWidget {
  final setActiveTax;
  final int activeTax;
  final int value;
  const TaxButton({Key? key,required this.setActiveTax, required this.activeTax,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
            onPressed: () => setActiveTax(value),
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => activeTax == value ? Colors.blue : Colors.grey)),
            child: Text(value.toString()+'%')));
  }
}
