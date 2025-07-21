import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../mobile_widgets/mobile_pop_up.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 375.w,
            height: 75.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6F7) /* semantic-bg-subtle */,
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
                SvgPicture.asset('assets/icons/zent.svg', height: 55.h),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => MobilePopUp(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xFF004ABA),
                    fixedSize: Size(156.w, 55.h),
                  ),
                  child: SelectableText(
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
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFF131214) /* semantic-bg-contrast */,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  'We are launching soon. ',
                  style: TextStyle(
                    color: Colors.white /* semantic-fg-on-contrast */,
                    fontSize: 10.sp,
                    fontFamily: 'manrope-semibold',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SvgPicture.asset('assets/icons/rocket.svg'),
                SelectableText(
                  ' Don’t be left out! Join our waitlist.',
                  style: TextStyle(
                    color: Colors.white /* semantic-fg-on-contrast */,
                    fontSize: 10.sp,
                    fontFamily: 'manrope-semibold',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 46.h),
          Container(
            width: 342.r,
            height: 342.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/Phone.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: 343.w,
            child: SelectableText(
              'Send Packages Faster, Cheaper, and Safer — With People Already on the Move',
              style: TextStyle(
                color: const Color(0xFF002966),
                fontSize: 18.sp,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                height: 1.20,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 343.w,
            child: SelectableText(
              'Introducing Zent, Nigeria’s peer-to-peer delivery network. Trusted travelers. Real-time tracking. No more courier headache',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: const Color(0xFF131214) /* semantic-fg-base */,
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w300,
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => MobilePopUp());
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color(0xFF004ABA),
              fixedSize: Size(355.w, 64.h),
            ),
            child: SelectableText(
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
          SizedBox(height: 8.h),
          SelectableText(
            '🎉 1,492 people have already joined Zent\'s waitlist.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6E7375) /* semantic-fg-muted */,
              fontSize: 14.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w300,
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }
}
