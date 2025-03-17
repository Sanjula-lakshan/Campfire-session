// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

/// Note that the userID needs to be globally unique,
final String localUserID = math.Random().nextInt(10000).toString();

/// Users who use the same callID can in the same call.
const String callID = "group_call_id";

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 772653556,
        appSign: "ff31aa9da2219176ca86650e47df1f572040b88be0185b1ce596f8ab4519f5da",
        userID: localUserID,
        userName: "user_$localUserID",
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  /// Users who use the same conferenceID can in the same conference.
  var conferenceDTextCtrl = TextEditingController(text: "video_conference_id");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: conferenceDTextCtrl,
                  decoration: const InputDecoration(
                      labelText: "join a conference by id"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return VideoConferencePage(
                          conferenceID: conferenceDTextCtrl.text,
                        );
                      }),
                    );
                  },
                  child: const Text("join"))
            ],
          ),
        ),
      ),
    );
  }
}