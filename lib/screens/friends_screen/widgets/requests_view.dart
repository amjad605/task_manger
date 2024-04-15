import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manger/screens/friends_screen/widgets/request_item.dart';

import 'friend_item.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => RequestItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 18.h,
                ),
                itemCount: 5),
          ),
        ],
    );
  }
}
