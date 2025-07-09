import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zent_web/repository/remote_repo.dart';
import 'package:zent_web/utils/form_validator.dart';
import 'package:zent_web/widgets/custom_form.dart';

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  String? selectedValue;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      child: Container(
        height: 370.h,
        width: 498.w,
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
                  fontSize: 32.sp,
                  fontFamily: 'manrope-semibold',
                  fontWeight: FontWeight.w600,
                  height: 1.20,
                ),
              ),
              SizedBox(height: 8.h),
              CustomForm(
                controller: nameController,
                width: 450,
                focus: nameFocus,
                color: Colors.white,
                keyboardType: TextInputType.name,
                borderColor: Color(0xFFE6E9EB),
                autofillHints: [AutofillHints.name],
                hintText: 'Name',
                validator: FormValidation.validateData,
              ),
              SizedBox(height: 8.h),
              CustomForm(
                controller: emailController,
                width: 450,
                focus: emailFocus,
                color: Colors.white,
                keyboardType: TextInputType.name,
                borderColor: Color(0xFFE6E9EB),
                autofillHints: [AutofillHints.email],
                hintText: 'Email Address',
                validator: FormValidation.emailValidation,
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 450.w,
                child: DropdownButtonFormField<String>(
                  value: selectedValue,
                  validator: FormValidation.validateData,
                  items:
                      ['Sender/Business', 'Frequent traveller']
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
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
                      fontSize: 16.sp,
                      fontFamily: 'manrope-light',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down),
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
                  fixedSize: Size(450.w, 48.h),
                ),
                child:
                    isloading
                        ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: CircularProgressIndicator(color: Colors.white),
                        )
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
