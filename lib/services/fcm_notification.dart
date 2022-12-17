import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FCMService {


  /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
  String constructFCMPayload() {
    return jsonEncode(
      {
        "to":
            "cV-aIaN9SMOU_EL5Kxpgfu:APA91bG8F2gAeJZ_HLaf_43_JrdrvNcHbXedjeQFAdKSKxpYGZ2uXE0mg6J25O_yL7KOUdJA9pXfuz4CCWAq-eVAMJ7DHwmAy297MQ5Cw3Nv6C_7IHymbb25P--j9vjbmUO1_atoynwM",
        "notification": {
          "title": "you have received a message from Ashmawi",
          "body": "testing body from post man",
          "sound": "default"
        },
        "android": {
          "priority": "HIGH",
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default",
            "default_sound": true,
            "default_vibrate_timings": true,
            "default_light_settings": true
          }
        },
        "data": {
          "type": "order",
          "id": "87",
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      },
    );
  }

  Future<void> sendPushMessage() async {


    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAnINfF4Q:APA91bHzr6QiOSTy9K5xSKBc7TFXAIPaKgPkftT4X-QzFw9L6cKz7oeMkM-ze7heATqK_r-3muX-nHHOCpklY7QcOfue3T0GiGLMyrJTzrWX9pMQAIfsgLACTrS1XYgbqGwghzTILnUD',
        },
        body: constructFCMPayload(),
      );
      if (kDebugMode) {
        print('FCM request for device sent!');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
