import 'package:flutter/material.dart';
import 'package:signup_phone_otp/components/custom_dialog.dart';
import 'package:signup_phone_otp/components/dialog_process.dart';
import 'package:signup_phone_otp/components/ink_well.dart';
import 'package:signup_phone_otp/components/validator.dart';
import 'package:signup_phone_otp/phone_reg_screens%20/phone_verification.dart';
import 'package:signup_phone_otp/themes/styles.dart';

class SignupPhoneScreen extends StatefulWidget {
  @override
  _SignupPhoneScreenState createState() => _SignupPhoneScreenState();
}

class _SignupPhoneScreenState extends State<SignupPhoneScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  Validations validations = new Validations();
  bool isLoading = false;
  TextEditingController phoneController = new TextEditingController();
  bool forgetPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: InkWellCustom(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Stack(children: <Widget>[
            Container(
              height: 250.0,
              width: double.infinity,
              color: Color(0xFFF44336).withOpacity(0.3),
            ),
            Positioned(
              bottom: 450.0,
              right: 100.0,
              child: Container(
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
                  color: Color(0xFFF44336),
                ),
              ),
            ),
            Positioned(
              bottom: 500.0,
              left: 150.0,
              child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0),
                      color: Color(0xFFF44336).withOpacity(0.5))),
            ),
            new Padding(
                padding: EdgeInsets.fromLTRB(32.0, 150.0, 32.0, 0.0),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                            //padding: EdgeInsets.only(top: 100.0),
                            child: new Material(
                          borderRadius: BorderRadius.circular(7.0),
                          elevation: 5.0,
                          child: new Container(
                            width: MediaQuery.of(context).size.width - 20.0,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: new Form(
                                key: formKey,
                                child: new Container(
                                  padding: EdgeInsets.all(32.0),
                                  child: new Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Sign up',
                                        style: heading35Black,
                                      ),
                                      new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextFormField(
                                            controller: phoneController,
                                            keyboardType: TextInputType.number,
                                            validator:
                                                validations.validateMobile,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              prefixIcon: Icon(
                                                Icons.phone,
                                                color: Color(getColorHexFromStr(
                                                    '#FFFF0000')),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 20.0, top: 15.0),
                                              hintText: 'Phone Number',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Quicksand'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      isLoading == false
                                          ? ButtonTheme(
                                              height: 45.0,
                                              minWidth: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: RaisedButton.icon(
                                                shape:
                                                    new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                10.0)),
                                                elevation: 3.0,
                                                color: blackColor,
                                                splashColor: Colors.white,
                                                textColor: Colors.black,
                                                icon: new Text(''),
                                                label: new Text(
                                                  'NEXT',
                                                  style: headingWhite,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                  _otpPhoneGenerator(context);
                                                },
                                              ),
                                            )
                                          : dialogProgress(),
                                    ],
                                  ),
                                )),
                          ),
                        )),
                        new Container(
                            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "Already have an account? ",
                                  style: textGrey,
                                ),
                                new InkWell(
                                  // ! Handle your routing here
                                  child: new Text(
                                    "Log In", //! Any route name here
                                    style: textStyleActive,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ))),
          ])
        ]),
      )),
    );
  }

  _otpPhoneGenerator(BuildContext context) async {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      setState(() {
        isLoading = false;
      });
      autovalidate = true; // Start validating on every change.
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhoneVerification(
            phone: phoneController,
          ),
        ),
      );
      //  ! API calls here
    }
  }

  dialogInfo() {
    return CustomDialogInfo(
      title: "Error!",
      body: "Something went wrong! Try again.",
      onTap: () {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      },
    );
  }
}
