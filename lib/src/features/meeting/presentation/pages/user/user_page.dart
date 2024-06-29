import 'package:academy/src/features/meeting/meeting.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(IconManager.previous, color: Theme.of(context).colorScheme.primary,),
        ),
        title: Text(
          "About This Call",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: UserListWidget(),
      ),
    );
  }
}