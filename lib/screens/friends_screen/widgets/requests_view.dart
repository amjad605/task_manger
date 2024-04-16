import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_manger/cubits/add_friend_cubit/add_friend_cubit.dart';
import 'package:task_manger/cubits/friends/friends_cubit.dart';
import 'package:task_manger/cubits/manage_friend_request/manage_friend_request_cubit.dart';
import 'package:task_manger/screens/friends_screen/widgets/request_item.dart';

import '../../../Constants/constants.dart';
import '../../../models/user_model.dart';
import 'friend_item.dart';

class RequestsView extends StatelessWidget {
   RequestsView({super.key});
  List<Request>requests=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendsCubit, FriendsState>(
      listener: (context, state) {
        if(state is GetMyRequestsSuccessState){
         requests= BlocProvider.of<FriendsCubit>(context).requests;
        }
      },
      builder: (context, state) {
        if (state is GetMyRequestsLoadingState) {
          return Center(
            child: LoadingAnimationWidget.flickr(
                leftDotColor: kMainColor,
                rightDotColor: kLightblue,
                size: 24),
          );
        }
        else {
          return Column(
            children: [
            if(!(state is GetMyRequestsFailureState))  Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => RequestItem(request: requests[index],),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 18.h,
                        ),
                    itemCount: requests.length),
              ),
            ],
          );
        }
      },
    );
  }
}
