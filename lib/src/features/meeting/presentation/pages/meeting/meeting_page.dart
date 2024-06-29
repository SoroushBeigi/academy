import 'package:academy/src/features/meeting/meeting.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MeetingHeaderWidget(),
              MeetingBodyWidget(),
              MeetingFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
