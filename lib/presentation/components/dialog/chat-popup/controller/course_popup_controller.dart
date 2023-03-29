import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

enum ChatAction {
  reply("Reply", Assets.reply),
  delete("Delete message", Assets.trash),
  edit("Edit Comment", Assets.editIcon),
  cancel("Cancel", ""),

  files("Files & attachments", Assets.attachment),
  report("Report", Assets.flag),
  leave("Leave Workshop", Assets.leave),
  share("Share", Assets.share),
  contactUs("Contact us", Assets.contact),

  addVideo("Video", Assets.camera);

  final String? title;
  final String? icon;
  const ChatAction(
    this.title,
    this.icon,
  );
}

class CoursePopUpController {
  final _itemsController = BehaviorSubject<List<ChatAction>>.seeded([]);

  CoursePopUpController({required List<ChatAction> items}) {
    add(items);
  }

  Stream<List<ChatAction>> get itemsStream => _itemsController.stream;

  add(List<ChatAction> items) => _itemsController.add(items);

  close() {
    _itemsController.close();
  }
}
