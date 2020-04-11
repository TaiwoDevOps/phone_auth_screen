import 'package:flutter/material.dart';
import 'package:signup_phone_otp/components/customShowDialog.dart';
import 'package:signup_phone_otp/themes/styles.dart';

class CustomDialogInfo extends StatelessWidget {
  final String title, body;
  final Function onTap;

  const CustomDialogInfo({Key key, this.title, this.body, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: Container(
        width: 200.0,
        height: 240.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // dialog top
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                            child: Icon(
                              Icons.error,
                              color: greyColor2,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: onTap,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 0.0),
                              child: Icon(
                                Icons.close,
                                color: greyColor2,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 8.0, 0.0),
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            title != null ? title : '',
                            style: headingBlack,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 8.0, 0.0),
                    child: Text(
                      body != null ? body : '',
                      style: heading18Black,
                      //textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 110.0,
                height: 50.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Center(
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupCustomDialogInfo extends StatelessWidget {
  final String title, body;

  const SignupCustomDialogInfo({Key key, this.title, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: Container(
        width: 200.0,
        height: 340.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // dialog top
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                            child: Icon(
                              Icons.error,
                              color: greyColor2,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 8.0, 0.0),
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            title != null ? title : '',
                            style: headingBlack,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 8.0, 0.0),
                      child: Text(
                        body != null ? body : '',
                        style: heading18Black,
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
