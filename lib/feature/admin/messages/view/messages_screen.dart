import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/messages/widgets/messages_body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MessagesBody(),
    );
  }
}
