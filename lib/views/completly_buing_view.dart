import 'package:dinar_iraq/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/address_provider.dart';
import '../widgets/loading_widget.dart';
import 'all_address_view.dart';

enum SingingCharacter { lafayette, jefferson }

class CompletlyBuingView extends StatefulWidget {
  const CompletlyBuingView({Key? key}) : super(key: key);

  @override
  State<CompletlyBuingView> createState() => _CompletlyBuingViewState();
}

class _CompletlyBuingViewState extends State<CompletlyBuingView> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  String address = "";
  String autocompletePlace = "";
  Prediction? initialValue;
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _countrycontroller = TextEditingController();
  final TextEditingController _citycontroller = TextEditingController();
  final TextEditingController _streetcontroller = TextEditingController();
  final TextEditingController _floorcontroller = TextEditingController();
  final TextEditingController _notescontroller = TextEditingController();
  final TextEditingController _postCodecontroller = TextEditingController();
  final TextEditingController _buildingcontroller = TextEditingController();
@override
  void initState() {
    if(Provider.of<UserProvider>(context,listen: false).myAddress!=null){
      setState(() {
        address = "${Provider.of<UserProvider>(context,listen: false).myAddress!.lat},${Provider.of<UserProvider>(context,listen: false).myAddress!.lng}";
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Consumer(
          builder: (BuildContext ctx, AddressProvider addressProvider, _) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: AppColors.BackgroundColor,
            title: Text(
              'اتمام الشراء',
              style: TextStyle(
                  color: AppColors.MainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFieldCustom(
                    label: 'Country',
                    cntroller: _countrycontroller,
                    icn: Icons.location_city,
                  ),
                  TextFieldCustom(
                    label: 'City',
                    cntroller: _citycontroller,
                    icn: Icons.location_city,
                  ),
                  TextFieldCustom(
                    label: 'Street',
                    cntroller: _streetcontroller,
                    icn: Icons.location_on,
                  ),
                  TextFieldCustom(
                    label: 'Floor',
                    cntroller: _floorcontroller,
                    icn: Icons.flood,
                  ),
                  TextFieldCustom(
                    label: 'Phone',
                    cntroller: _phonecontroller,
                    icn: Icons.phone,
                  ),
                  TextFieldCustom(
                    label: 'Post Code',
                    cntroller: _postCodecontroller,
                    icn: Icons.post_add,
                  ),
                  TextFieldCustom(
                    label: 'Building',
                    cntroller: _buildingcontroller,
                    icn: Icons.location_on,
                  ),
                  TextFieldCustom(
                    label: 'Notes',
                    cntroller: _notescontroller,
                    icn: Icons.note_alt_rounded,
                  ),
                  SizedBox(
                    height: 0.01 * h,
                  ),
                  Card(
                    margin: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.MainColor,
                            ),
                            child: Text(
                              'تغيير العنوان',
                              style: TextStyle(
                                  color: AppColors.BackgroundColor,
                                  fontSize: 12),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const AllAddressView()));
                            },
                          ),
                        ),
                        Text(
                          'التوصيل الي',
                          style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: ListTile(
                      title: Text(
                        "Address: $address",
                        style: TextStyle(
                          color: AppColors.MainColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.01 * h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'اختر طريقه للدفع',
                        style: TextStyle(
                            color: AppColors.BlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Card(
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('الدفع عند الاستلام'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.lafayette,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('الدفع عن طريق الفيزا'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.jefferson,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.04 * h,
                  ),
                  SizedBox(
                    width: w,
                    child: addressProvider.isLoading
                        ? loadingWidget()
                        : TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.MainColor,
                            ),
                            child: Text(
                              'اتمام الطلب',
                              style: TextStyle(
                                color: AppColors.BackgroundColor,
                              ),
                            ),
                            onPressed: () {
                              // addressProvider.addresss(
                              //     city: _citycontroller.text,
                              //     country: _countrycontroller.text,
                              //     postcode: _postCodecontroller.text,
                              //     building: _buildingcontroller.text,
                              //     floor: _floorcontroller.text,
                              //     notes: _notescontroller.text,
                              //     street: _streetcontroller.text,
                              //     phone: _phonecontroller.text,
                              //      lat: '',
                              //      lng: '',
                              //    );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  final String label;
  final TextEditingController cntroller;
  final IconData icn;
  const TextFieldCustom(
      {super.key,
      required this.label,
      required this.cntroller,
      required this.icn});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5.0),
      child: TextField(
        controller: cntroller,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: AppColors.MainColor,
          ),
          suffixIcon: Icon(icn),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
