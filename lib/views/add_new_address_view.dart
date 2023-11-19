import 'package:dinar_iraq/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_location_picker/map_location_picker.dart' as x;
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../model/address_model.dart' as z;
import '../providers/address_provider.dart';
import '../widgets/loading_widget.dart';

enum SingingCharacter { lafayette, jefferson }

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({Key? key}) : super(key: key);

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  String address = "";
  String autocompletePlace = "";
  x.Prediction? initialValue;
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _countrycontroller = TextEditingController();
  final TextEditingController _citycontroller = TextEditingController();
  final TextEditingController _streetcontroller = TextEditingController();
  final TextEditingController _floorcontroller = TextEditingController();
  final TextEditingController _notescontroller = TextEditingController();
  final TextEditingController _postCodecontroller = TextEditingController();
  final TextEditingController _buildingcontroller = TextEditingController();
  bool isLoading = false;
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
              'اضافه عنوان جديد',
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
                              'تحديد الموقع',
                              style: TextStyle(
                                  color: AppColors.BackgroundColor,
                                  fontSize: 12),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return x.MapLocationPicker(
                                      apiKey:
                                          "AIzaSyBEKtj_QkBovkCfRud0RZcGDQHuAgLGQtI",
                                      popOnNextButtonTaped: true,
                                      currentLatLng:
                                          const x.LatLng(30.033333, 31.233334),
                                      onNext: (x.GeocodingResult? result) {
                                        if (result != null) {
                                          setState(() {
                                            address =
                                                result.formattedAddress ?? "";
                                          });
                                        }
                                      },
                                      onSuggestionSelected:
                                          (x.PlacesDetailsResponse? result) {
                                        if (result != null) {
                                          setState(() {
                                            autocompletePlace = result
                                                    .result.formattedAddress ??
                                                "";
                                          });
                                        }
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          'الموقع',
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
                        "العنوان: ${address}",
                        style: TextStyle(
                          color: AppColors.MainColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.01 * h,
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
                              'اضافه',
                              style: TextStyle(
                                color: AppColors.BackgroundColor,
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              x.LatLng latLng =
                                  await getLocationLatLng(address);


                                  await addressProvider.addresss(
                                      city: _citycontroller.text,
                                      country: _countrycontroller.text,
                                      postcode: _postCodecontroller.text,
                                      building: _buildingcontroller.text,
                                      floor: _floorcontroller.text,
                                      notes: _notescontroller.text,
                                      street: _streetcontroller.text,
                                      phone: _phonecontroller.text,
                                      token:  Provider.of<UserProvider>(context,listen: false).user!.token!,
                                      lat: latLng.latitude,
                                      lng: latLng.longitude,
                                      onSuccess: () {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Future.delayed(Duration.zero,(){

                                          Provider.of<UserProvider>(context,listen: false).setUser();
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      onFailure: (String v) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      });

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

  Future<x.LatLng> getLocationLatLng(String locationName) async {
    try {
      List<Location> locations = await locationFromAddress(locationName);
      if (locations.isNotEmpty) {
        return x.LatLng(locations[0].latitude, locations[0].longitude);
      } else {
        throw Exception('No location found for $locationName');
      }
    } catch (e) {
      throw Exception('Error fetching location: $e');
    }
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
