import 'package:flutter/material.dart';
import 'package:droute_frontend/styles/color/app_color.dart';
import 'package:droute_frontend/models/auth_model.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});



  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final AuthModel _authModel = AuthModel();
  final List<TextEditingController> _emailOtpControllers =
  List.generate(6, (index) => TextEditingController());

  bool _isLoading = false;
  String? _errorMessage;
  Color _errorMessageColor = Colors.red;

  String _getOtpValue() {
    return _emailOtpControllers.map((controller) => controller.text).join();
  }

  Future<void> _verifyOtp(Map<String, dynamic> args) async {
    String enteredOtp = _getOtpValue();
    print("otp entered is"+enteredOtp);
    print("Received OTP from server: ${args['otpResponse']}");

    if (enteredOtp.length != 6) {
      setState(() {
        _errorMessage = "Please enter the 6-digit OTP!";
        _errorMessageColor = Colors.red;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (enteredOtp == args['otpResponse']) {
        setState(() {
          _errorMessage = "OTP verified successfully!";
          _errorMessageColor = Colors.green;
        });

        final response = await _authModel.register(
          args['fullName'] ?? '',
          args['password'] ?? '',
          args['email'] ?? '',
          args['mobile'] ?? '',
        );

        if (response["message"] == "User created Successfully.") {
          setState(() {
            _errorMessage = "Registration successful! Please log in.";
            _errorMessageColor = Colors.green;

          });

          // Wait for 3 seconds before navigating
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushNamed(context, '/signin');
          });
        } else {
          setState(() {
            _errorMessage = "Registration failed: ${response["message"] ?? "Unknown error"}";
            _errorMessageColor = Colors.red;
          });
        }
      } else {
        setState(() {
          _errorMessage = "Invalid OTP, please try again.";
          _errorMessageColor = Colors.red;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "An error occurred: $e";
        _errorMessageColor = Colors.red;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: AppColor.deepOceanBlue,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/droute_logo.png',
                            width: 200,
                            height: 160,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                            Text(
                              "Email OTP",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                              SizedBox(height: 30),
                              _buildOtpField(),
                              SizedBox(height: 20),


// Display error message or success message
                              if (_errorMessage != null)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    _errorMessage ?? '',
                                    style: TextStyle(
                                      color: _errorMessageColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                              SizedBox(height: 20),

                              InkWell(
                                onTap: _isLoading
                                    ? null
                                    : () {
                                  if (args != null) {
                                    _verifyOtp({
                                      'otpResponse': args['otpResponse'],
                                      'fullName': args['fullName'],
                                      'password': args['password'],
                                      'email': args['email'],
                                      'mobile': args['mobile'],
                                    });
                                  } else {
                                    setState(() {
                                      _errorMessage =
                                      "Something went wrong! Try again.";
                                      _errorMessageColor = Colors.red;
                                    });
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _isLoading ? Colors.grey : AppColor.deepOceanBlue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: _isLoading
                                      ? Center(child: CircularProgressIndicator(color: Colors.white))
                                      : Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signin');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already Have an Account?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 5),
                                    Text("Sign In",
                                        style: TextStyle(
                                            color: AppColor.deepOceanBlue,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOtpField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: 50,
            height: 55,
            child: TextField(
              controller: _emailOtpControllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                counterText: "",
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  CustomText({required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
