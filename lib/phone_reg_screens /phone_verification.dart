import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:signup_phone_otp/components/custom_dialog.dart';
import 'package:signup_phone_otp/components/dialog_process.dart';
import 'package:signup_phone_otp/components/ink_well.dart';
import 'package:signup_phone_otp/themes/styles.dart';

class PhoneVerification extends StatefulWidget {
  final TextEditingController phone;

  const PhoneVerification({Key key, this.phone}) : super(key: key);
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController controller = TextEditingController();
  int pinLength = 4;
  String otpVal = '';
  bool isLoading = false;

  bool hasError = false;
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () {
            // ! Handle route here
          },
        ),
      ),
      body: SingleChildScrollView(
          child: InkWellCustom(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0.0, 20, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                  child: Text(
                    'Phone Verification',
                    style: heading35Black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text('Enter your OTP code hear'),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 12),
                    child: PinCodeTextField(
                      autofocus: true,
                      controller: controller,
                      hideCharacter: false,
                      highlight: true,
                      highlightColor: secondary,
                      defaultBorderColor: blackColor,
                      hasTextBorderColor: primaryColor,
                      maxLength: pinLength,
                      hasError: hasError,
                      maskCharacter: "*",
                      onTextChanged: (text) {
                        setState(() {
                          hasError = false;
                        });
                      },
                      onDone: (text) {
                        setState(() {
                          print('OTP================$text');
                          otpVal = text;
                        });
                      },
                      wrapAlignment: WrapAlignment.start,
                      pinBoxDecoration:
                          ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                      pinTextStyle: heading35Black,
                      pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.scalingTransition,
                      pinTextAnimatedSwitcherDuration:
                          Duration(milliseconds: 300),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                isLoading == false
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ButtonTheme(
                          height: 45.0,
                          minWidth: MediaQuery.of(context).size.width,
                          child: RaisedButton.icon(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            elevation: 3.0,
                            splashColor: Colors.white,
                            textColor: Colors.black,
                            color: blackColor,
                            icon: new Text(''),
                            label: new Text(
                              'VERIFY OTP',
                              style: headingWhite,
                            ),
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                              });
                              otpverify(int.parse(otpVal));
                            },
                          ),
                        ),
                      )
                    : dialogProgress(),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new InkWell(
                        onTap: () {
// ! Handle route here
                        },
                        child: new Text(
                          "I didn't get a code",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      )),
    );
  }

  void otpverify(int otp) async {}

  dialogInfo(String otpError) {
    return CustomDialogInfo(
      title: "OTP Error",
      body: otpError,
      onTap: () {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
      },
    );
  }
}
