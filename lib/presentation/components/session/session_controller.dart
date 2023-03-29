import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/app/log.dart';
import 'package:unimastery_mobile/presentation/components/session/model/session_model.dart';
import 'package:unimastery_mobile/presentation/components/video-player/video_controller.dart';

enum VideoState {
  initial,
  canPickAnother,
  uploaded,
}

class SessionController {
  final ImagePicker imagePicker;

  SessionController({
    required this.imagePicker,
  });

  final videoController = BehaviorSubject<VideoController?>();
  final videoStateController = BehaviorSubject<VideoState>.seeded(VideoState.initial);
  final commentListController = BehaviorSubject<List<SessionModel>>.seeded(
    [
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "Hope you all had great times yesterday",
        id: 0,
      ),
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "Hope you all had great times yesterday",
        id: 1,
      ),
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "Hope you all had great times yesterday",
        id: 2,
      ),
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "Hope you all had great times yesterday",
        id: 3,
      ),
    ],
  );

  Stream<VideoController?> get videoControllerStream => videoController.stream;
  Stream<List<SessionModel>> get commentListStream => commentListController.stream;

  pickVideo() async {
    try {
      final pickedVideo = await imagePicker.pickVideo(
        source: ImageSource.gallery,
      );

      if (pickedVideo == null) return;
      final file = File(pickedVideo.path);

      videoController.add(VideoController(file: file));
      videoStateController.add(VideoState.canPickAnother);
    } catch (e) {
      Logger.error(e);
    }
  }

  likeComment(int index) {
    commentListController.where((event) => event[index].id == index);
    final list = commentListController.value;
    final item = list[index];
    item.isLiked = true;
    item.likeCount = item.likeCount + 1;
    commentListController.add(list);
  }
}
