import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zent_web/widgets/custom_form.dart';

import '../repository/remote_repo.dart';
import '../utils/form_validator.dart';

class MobilePopUp extends StatefulWidget {
  const MobilePopUp({super.key});

  @override
  State<MobilePopUp> createState() => _MobilePopUpState();
}

class _MobilePopUpState extends State<MobilePopUp> {
  String? selectedValue;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      child: Container(
        height: 360.h,
        width: 377.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Join the waitlist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF131214) /* semantic-fg-base */,
                  fontSize: 24.sp,
                  fontFamily: 'manrope-semibold',
                  fontWeight: FontWeight.w600,
                  height: 1.20,
                ),
              ),
              SizedBox(height: 8.h),
              CustomForm(
                controller: nameController,
                validator: FormValidation.validateData,
                width: 345,
                focus: nameFocus,
                color: Colors.white,
                keyboardType: TextInputType.name,
                borderColor: Color(0xFFE6E9EB),
                autofillHints: [AutofillHints.name],
                hintText: 'Name',
              ),
              SizedBox(height: 8.h),
              CustomForm(
                controller: emailController,
                width: 345,
                validator: FormValidation.emailValidation,
                focus: emailFocus,
                color: Colors.white,
                keyboardType: TextInputType.name,
                borderColor: Color(0xFFE6E9EB),
                autofillHints: [AutofillHints.email],
                hintText: 'Email Address',
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 345.w,
                child: DropdownButtonFormField<String>(
                  validator: FormValidation.validateData,
                  value: selectedValue,
                  items:
                      ['Sender/Business', 'Traveller']
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                  fontFamily: 'manrope-light',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Color(0xFFE6E9EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Color(0xFFE6E9EB)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Color(0xFFE6E9EB)),
                    ),
                  ),
                  hint: Text(
                    'Which of these best describes you?',
                    style: TextStyle(
                      color: const Color(0xFF898D8F) /* semantic-fg-subtle */,
                      fontSize: 10.sp,
                      fontFamily: 'manrope-light',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isloading = !isloading;
                  });
                  if (_formKey.currentState!.validate() &&
                      selectedValue != null) {
                    await Repository().addWaitlistUser({
                      'email': emailController.text,
                      'name': nameController.text,
                      'usertype': selectedValue,
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Thank you for joining our waitlist. We look forward to serving you',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'manrope-light',
                          ),
                        ),
                      ),
                    );
                  }
                  setState(() {
                    isloading = !isloading;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF004ABA),
                  elevation: 0,
                  fixedSize: Size(345.w, 48.h),
                ),
                child:
                    isloading
                        ? CircularProgressIndicator()
                        : Text(
                          'Join Waitlist',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'manrope-medium',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
