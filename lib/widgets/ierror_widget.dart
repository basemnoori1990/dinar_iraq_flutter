import 'package:flutter/material.dart';

class IErrorWidget extends StatelessWidget {
  const IErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/error.png'),
          ),
          const SizedBox(height: 20),
          const Text("عذرا انه خطأ!",
              style: TextStyle(
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}
