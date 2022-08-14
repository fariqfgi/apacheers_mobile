import 'package:apacheers_mobile/providers/auth_provider.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:apacheers_mobile/widget/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinCode extends StatefulWidget {
  PinCode({Key? key}) : super(key: key);

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  bool isLoading = false;
  String? finalName;
  String? finalToken;
  String? finalIdUser;
  String? finalCode;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      finalIdUser = prefs.getString('id_user');
      finalCode = prefs.getString('code');
      print(finalIdUser);
      print(finalCode);
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login2fa(
        iduser: finalIdUser!,
        code: finalCode!,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryColor,
            content: Text(
              'Verify Failed!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verification Code',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Please type the verification code',
              style: subtitleTextStyle,
            ),
            Text(
              'sent to your mail',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget pincodeField() {
      return Container(
        margin: EdgeInsets.only(
          left: 10.0,
          top: 80.0,
          right: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PinCodeTextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: backgroundColor1,
              enableActiveFill: true,
              controller: textEditingController,
              onCompleted: (v) async {
                // SHARED PREFENCES
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('code', v);
                debugPrint("Completed");
                print(prefs.getString('code'));
              },
              onChanged: (value) {
                debugPrint(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                return true;
              },
              appContext: context,
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignIn,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Verify',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              pincodeField(),
              isLoading ? LoadingButton() : signInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
