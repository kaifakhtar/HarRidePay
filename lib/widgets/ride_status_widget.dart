import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideStatusWidget extends ConsumerStatefulWidget {
  //const RideStatusWidget({super.key});
  String driverName;
  int code;
  String driverMobNno;
  RideStatusWidget(
      {required this.driverName,
      required this.code,
      required this.driverMobNno});
  @override
  ConsumerState<RideStatusWidget> createState() => _RideStatusWidgetState();
}

class _RideStatusWidgetState extends ConsumerState<RideStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
      child: Container(
        height: 290.h,
        width: 340.w,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12.r,
                spreadRadius: 2.r,
                offset: Offset(0.h, 0.h))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Code',
                  style: GoogleFonts.poppins(fontSize: 20.sp),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      color: Color.fromARGB(255, 216, 255, 216)),
                  child: Text(
                    widget.code.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Color.fromARGB(255, 14, 137, 18)),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.driverName,
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp, color: Colors.black.withOpacity(.7)),
                ),
                Text(
                  widget.driverMobNno,
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.7),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 28.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pickup',
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp, color: Colors.orange),
                ),
                Text(
                  'Drop',
                  style:
                      GoogleFonts.poppins(fontSize: 12.sp, color: Colors.green),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Night Canteen',
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 39, 38, 36)),
                ),
                Text(
                  'Hostel 7',
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 31, 34, 32)),
                ),
              ],
            ),
            SizedBox(
              height: 28.h,
            ),
            // Divider(
            //   thickness: 1.h,
            // ),
            // SizedBox(
            //   height: 12.h,
            // ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(.1),
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  border: Border.all(color: Colors.grey.withOpacity(.5))),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '23 apr 2023 at 11:30 pm',
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      '\u20B9 100',
                      style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          // color:
                          //     Color,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
