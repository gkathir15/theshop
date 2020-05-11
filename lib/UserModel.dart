import 'package:shared_preferences/shared_preferences.dart';
import 'Constants.dart';

class UserModel {

  UserModel()
  {
    firstName = sharedPreferences.getString("Name");
    phone = sharedPreferences.getString("Phone");
    address = sharedPreferences.get("Address");
    Landmark = sharedPreferences.get("Landmark");
  }

  String firstName = '';
  String phone = '';
  String address = "";
  String Landmark ="";
  String OrderObject = "";
  String total ="";
  save() {
    print('saving user using a web service');
    sharedPreferences.setString("Name",firstName);
    sharedPreferences.setString("Phone",phone);
    sharedPreferences.setString("Address",address);
    sharedPreferences.setString("Landmark", Landmark);
  }
}