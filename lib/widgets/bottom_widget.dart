import 'package:flutter/material.dart';

import '../constants.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            child: Container(
              height: 5.0,
              width: 134.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //border: Border.all(color: Colors.black, width: 5.0, style: BorderStyle.solid),
                color: bottomUnderline,
                //color: const Color(0xff989898),
                //boxShadow: const [BoxShadow(color: Colors.green, spreadRadius: 3),],
              ),
            ),
          ),
        )
    );
  }
}
