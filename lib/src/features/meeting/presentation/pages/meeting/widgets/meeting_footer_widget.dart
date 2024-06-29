import 'package:academy/src/features/meeting/meeting.dart';

class MeetingFooterWidget extends StatefulWidget {
  const MeetingFooterWidget({Key? key}) : super(key: key);

  @override
  State<MeetingFooterWidget> createState() => _MeetingFooterWidgetState();
}

class _MeetingFooterWidgetState extends State<MeetingFooterWidget> {

  bool changeVideoCam = false;
  bool changeHandRise = false;
  bool changeMicIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12, horizontal: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(AppSize.s48),
            ),
            child: Icon(
              IconManager.callEnd,
              color: LightColorManager.white,
            ),
          ),
          Space.w8,
          CircularButton(
            onTap: () {
              setState(() {
                changeVideoCam =! changeVideoCam;
              });
            },
            icon: changeVideoCam ? IconManager.videoCam : IconManager.videoCamOff,
          ),
          Space.w8,
          CircularButton(
            onTap: () {
              setState(() {
                changeMicIcon =! changeMicIcon;
              });
            },
            icon: changeMicIcon ? IconManager.micOff : IconManager.mic,
          ),
          Space.w8,
          CircularButton(
            onTap: () {
              setState(() {
                changeHandRise =! changeHandRise;
              });
            },
            icon: IconManager.handRise,
          ),
          Space.w8,
          CircularButton(
            onTap: () => openBottomSheet(context: context),
            icon: IconManager.moreVert,
          ),
        ],
      ),
    );
  }
}

Widget iconButton({required BuildContext context, required IconData icon, required String text, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary,),
        Text(text, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    ),
  );
}


void openBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      final double screenHeight = MediaQuery.of(context).size.height;
      final double bottomSheetHeight = screenHeight * 0.3;
      return SizedBox(
        height: bottomSheetHeight,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: GridView.count(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: AppSize.s12,
            childAspectRatio: 1.8,
            mainAxisSpacing: AppSize.s12,
            children: [
              iconButton(
                  context: context,
                  icon: IconManager.question,
                  text: 'In call messages',
                  onTap: () {
                    context.pushNamed('/chat');
                  }
              ),
              iconButton(
                  context: context,
                  icon: IconManager.present,
                  text: "Share screen",
                  onTap: () {  }
              ),
              iconButton(
                  context: context,
                  icon: IconManager.close,
                  text: 'Turn on captions',
                  onTap: () {  }
              ),
              iconButton(
                  context: context,
                  icon: IconManager.person,
                  text: 'Users',
                  onTap: () {
                    context.pushNamed('/meeting_users');
                  }
              ),
              iconButton(
                  context: context,
                  icon: IconManager.report,
                  text: 'Report abuse',
                  onTap: () {  }
              ),
              iconButton(
                  context: context,
                  icon: IconManager.setting,
                  text: 'Settings',
                  onTap: () {  }
              ),
            ],
          ),
        ),
      );
    },
  );
}