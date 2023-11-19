import 'package:dinar_iraq/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_new_address_view.dart';

class AllAddressView extends StatefulWidget {
  const AllAddressView({super.key});

  @override
  State<AllAddressView> createState() => _AllAddressViewState();
}

class _AllAddressViewState extends State<AllAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddNewAddressView()));
        },
        label: const Text("اضافه عنوان جديد"),
      ),
      appBar: AppBar(
        title: const Text("كل العناوين"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "العنوان الحالى هو: ${Provider.of<UserProvider>(context, listen: false).myAddress!.lat + "," + Provider.of<UserProvider>(context, listen: false).myAddress!.lng}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "الكل",
              style: TextStyle(fontSize: 23),
            ),
            Column(
              children: Provider.of<UserProvider>(context, listen: false)
                  .allMyAddress!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "العنوان هو\n ${"${e.lat},${e.lng}"}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton(
                                    onPressed: () {
                                      Provider.of<UserProvider>(context,
                                              listen: false)
                                          .changeMyAddress(e);
                                      setState(() {});
                                    },
                                    child: const Text(
                                        "تغيير العنوان الى الافتراضى"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
