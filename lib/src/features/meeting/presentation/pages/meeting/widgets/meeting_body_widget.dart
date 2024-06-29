import 'package:academy/src/features/meeting/meeting.dart';
import 'utils/data.dart';
import 'widgets/body_widgets/user_card.dart';

class MeetingBodyWidget extends StatelessWidget {
  const MeetingBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
          DynamicGridView(roomUsers: roomUsers),

        // TODO length of members
        // Positioned(
        //   bottom: 10.0,
        //   right: 20.0,
        //   child: GestureDetector(
        //     onTap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (BuildContext context) => UsersScreen(),
        //         ),
        //       );
        //     },
        //     child: Container(
        //       padding: EdgeInsets.symmetric(
        //         vertical: 8.0,
        //         horizontal: 10.0,
        //       ),
        //       decoration: BoxDecoration(
        //         color: appPrimaryColor.withOpacity(0.9),
        //         borderRadius: BorderRadius.circular(20.0),
        //       ),
        //       child: Text(
        //         '${roomUsers.length} More',
        //         style: TextStyle(
        //           color: appWhite,
        //           fontSize: 15.0,
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ]),
    );
  }
}

class DynamicGridView extends StatelessWidget {
  final List<Participant> roomUsers;

  const DynamicGridView({Key? key, required this.roomUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double gridItemWidth = AppSize.s300;
    int crossAxisCount = (MediaQuery.of(context).size.width / gridItemWidth).floor();
    crossAxisCount = crossAxisCount > 0 ? crossAxisCount : 1;

    return GridView.count(
      padding: const EdgeInsets.all(AppPadding.p12),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: crossAxisCount,
      children: roomUsers.map((user) => UserCard(user: user)).toList(),
    );
  }
}