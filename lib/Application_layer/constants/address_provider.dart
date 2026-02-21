import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AddressProvider with ChangeNotifier {

  bool isLoadings = true;
  var categoriesId;

  LatLng lastMapPosition = const LatLng(0.0, 0.0);

  //LatLng get lastMapPosition => center;
  var loadedLocation = false;

  init() {
    isLoadings = true;
  }

  setCenter(value) {
    lastMapPosition = value;
    notifyListeners();
  }

  //AddressModal? data;

  double? latitude;
  double? longitude;
  String? address;
  String? pinCode;
  String? state;
  String? Locality;
  String? Country;

  String? houseNumber;
  String? locationId;
  String? appartmentOffice;
  String? landmark;
  String? tag;
  String? otherTag;
  String? isDefault;

  // setTagData(DataModal value){
  //   houseNumber = value.houseNumber;
  //   appartmentOffice = value.appartmentOffice;
  //   landmark = value.landmark;
  //   tag = value.tag;
  //   otherTag = value.otherTag;
  //   isDefault = value.isDefault;
  //   address = value.address;
  //   latitude = double.parse(value.latitude!);
  //   longitude = double.parse(value.longitude!);
  //   lastMapPosition = LatLng(latitude!, longitude!);
  // }

  clearTag() {
    houseNumber = "";
    appartmentOffice = "";
    landmark = "";
    tag = "";
    otherTag = "";
    address = "";
    pinCode = "";
    isDefault = "";
    latitude = 0.0;
    longitude = 0.0;
    lastMapPosition = const LatLng(0.0, 0.0);
  }

  setData(
      LatLng center,
      address, {
        state,
        city,
        pincode,
      }) {
    latitude = center.latitude;
    longitude = center.longitude;
    this.Locality = city;
    this.Country = state;
    this.pinCode = pinCode;

    this.address = address;
    loadedLocation = true;
    setCenter(center);
  }



  appDialog(BuildContext context, String message, type) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(
          title: const Text("GEOSNAP", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // primary: blackColor, // background
                  // onPrimary: whiteColor, // foreground
                ),
                onPressed: () {
                  if (type == "back") {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                  }

                  // getAddressApi("back");
                },
                child: const Text('OK')),
          ],
        ),
      ),
    );
  }
}
