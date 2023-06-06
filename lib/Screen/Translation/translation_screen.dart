import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class TranslationScreen extends StatelessWidget {
  const TranslationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // TextButton.icon(
              //     onPressed: () {},
              //     icon: Icon(Icons.camera),
              //     label: Text('Khmer')),
              Container(
                height: 50,
                child: Row(children: [
                  Image.asset('assets/Images/cambodia.png'),
                  Text(
                    "Khmer",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
              ),
              Container(
                height: 50,
                width: 100,
                child: Image.asset('assets/Images/cambodia.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
