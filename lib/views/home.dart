import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zent_web/widgets/pop_up.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: 1440.w,
              height: 80.h,
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.only(left: 68.w, right: 80.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6F7),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14141414),
                    blurRadius: 8,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x1E141414),
                    blurRadius: 1,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/zent.svg',
                    width: 136.w,
                    height: 40.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004ABA),
                      fixedSize: Size(160.w, 48.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.r),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => PopUp(),
                      );
                    },
                    child: Text(
                      'Join Waitlist',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white /* semantic-accent-on-accent */,
                        fontSize: 16.sp,
                        fontFamily: 'manrope-medium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: 1278.w,
              height: 80.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF131214) /* semantic-bg-contrast */,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    'We are launching soon. ',
                    style: TextStyle(
                      color: Colors.white /* semantic-fg-on-contrast */,
                      fontSize: 24.sp,
                      fontFamily: 'manrope-semibold',
                      fontWeight: FontWeight.w600,
                      height: 1.20,
                    ),
                  ),
                  SvgPicture.asset('assets/icons/rocket.svg'),
                  SelectableText(
                    ' Don’t be left out! Join our waitlist.',
                    style: TextStyle(
                      color: Colors.white /* semantic-fg-on-contrast */,
                      fontSize: 24.sp,
                      fontFamily: 'manrope-semibold',
                      fontWeight: FontWeight.w600,
                      height: 1.20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.only(left: 80.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 568.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Send Packages Faster, Cheaper, and Safer — With People Already on the Move',
                          style: TextStyle(
                            color: const Color(
                              0xFF002966,
                            ) /* semantic-accent-intense */,
                            fontSize: 64.sp,
                            fontFamily: 'manrope-bold',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SelectableText(
                          'Introducing Zent, Nigeria’s peer-to-peer package delivery network.  Trusted travelers. Real-time tracking. No more waybill headache',
                          style: TextStyle(
                            color: const Color(
                              0xFF131214,
                            ) /* semantic-fg-base */,
                            fontSize: 16.sp,
                            fontFamily: 'manrope-light',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF004ABA),
                            fixedSize: Size(160.w, 48.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48.r),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => PopUp(),
                            );
                          },
                          child: Text(
                            'Join Waitlist',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  Colors.white /* semantic-accent-on-accent */,
                              fontSize: 16.sp,
                              fontFamily: 'manrope-medium',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        SelectableText(
                          '🎉 1,492 people have already joined Zent\'s waitlist.',
                          style: TextStyle(
                            color: const Color(
                              0xFF6E7375,
                            ) /* semantic-fg-muted */,
                            fontSize: 18,
                            fontFamily: 'manrope-light',
                            fontWeight: FontWeight.w300,
                            height: 1.50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 25.w),
                  Container(
                    width: 780.r,
                    height: 780.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/Phone.png'),
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
