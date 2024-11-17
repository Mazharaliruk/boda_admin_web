import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/messages/widgets/chat.dart';
import 'package:admin_boda/feature/admin/messages/widgets/messages.dart';

class MessagesBody extends ConsumerStatefulWidget {
  const MessagesBody({super.key});

  @override
  ConsumerState<MessagesBody> createState() => _MessagesBodyState();
}

class _MessagesBodyState extends ConsumerState<MessagesBody> {
  final titleCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final sendToCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Messages(), Chat()],
    );
  }
}
