import 'package:flutter/material.dart';
import 'UserModel.dart';

class HomeMaterial extends StatefulWidget {

  final String OrderObj;
  final String total;


  HomeMaterial(this.OrderObj, this.total);

  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State {
  final _formKey = GlobalKey<FormState>();
  final _user = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.firstName = val),
                            ),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(labelText: 'Ph No'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your phone No.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.phone = val)),
                            TextFormField(
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Address',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Address.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.address = val)),
                            TextFormField(
                                keyboardType: TextInputType.multiline,
                                decoration:
                                    InputDecoration(labelText: 'landmark'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a landmark.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.Landmark = val)),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    onPressed: () {
                                    final form = _formKey.currentState;
                                    if (form.validate()) {
                                      form.save();
                                      _user.save();
                                      _showDialog(context);
                                    }
                                    },
                                    child: Text('Save'))),
                          ]),
                    )))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Placing Order form')));
  }
}
