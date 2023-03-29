import 'package:flutter/material.dart';

enum OpponentType { sender, receiver }

enum MessageType { text, image, video, audio, file }

abstract class IMessage {
  UniqueKey get id;
  OpponentType get opponentType;
  MessageType get messageType;
  String? text;
  String? avatarUrl;
  String? name;
  String? time;
  String? mediaUrl;
  String? thumbnailUrl;
  IMessage? replyTo;
  GlobalKey? messageKey;

  IMessage copyWith({
    UniqueKey? id,
    OpponentType? opponentType,
    MessageType? messageType,
    String? text,
    String? avatarUrl,
    IMessage? replyTo,
    String? name,
    String? time,
    String? mediaUrl,
    String? thumbnailUrl,
    GlobalKey? messageKey,
  });
}

class Message implements IMessage {
  Message({
    required this.id,
    this.opponentType = OpponentType.sender,
    this.messageType = MessageType.text,
    this.text,
    this.avatarUrl,
    this.replyTo,
    this.name,
    this.time,
    this.mediaUrl,
    this.thumbnailUrl,
    this.messageKey,
  });

  @override
  final UniqueKey id;

  @override
  final OpponentType opponentType;

  @override
  final MessageType messageType;

  @override
  String? text;

  @override
  String? avatarUrl;

  @override
  String? name;

  @override
  String? time;

  @override
  String? mediaUrl;

  @override
  IMessage? replyTo;

  @override
  String? thumbnailUrl;

  @override
  GlobalKey? messageKey;

  @override
  copyWith({
    UniqueKey? id,
    OpponentType? opponentType,
    MessageType? messageType,
    String? text,
    String? avatarUrl,
    IMessage? replyTo,
    String? name,
    String? time,
    String? mediaUrl,
    String? thumbnailUrl,
    GlobalKey? messageKey,
  }) {
    return Message(
      id: id ?? this.id,
      opponentType: opponentType ?? this.opponentType,
      messageType: messageType ?? this.messageType,
      text: text ?? this.text,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      replyTo: replyTo ?? this.replyTo,
      name: name ?? this.name,
      time: time ?? this.time,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      messageKey: messageKey ?? this.messageKey,
    );
  }
}
