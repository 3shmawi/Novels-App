import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fcm.googleapis.com/fcm/send',
        receiveDataWhenStatusError: true,
      ),
    );


  }

  static Future<Response> postFCMNotification({
    required String token,
    required String body,
    required String title,
  }) async {
    dio!.options.headers = {
      'Authorization':
          'key=AAAAnINfF4Q:APA91bHzr6QiOSTy9K5xSKBc7TFXAIPaKgPkftT4X-QzFw9L6cKz7oeMkM-ze7heATqK_r-3muX-nHHOCpklY7QcOfue3T0GiGLMyrJTzrWX9pMQAIfsgLACTrS1XYgbqGwghzTILnUD',
      'Content-Type': 'application/json',
    };

    return dio!.post(
      '',
      data: {
        "to": token,
        "notification": {
          "title": title,
          "body": body,
          "android_channel_id": "novel",
        },
        "android": {
          "priority": "HIGH",
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default",
            "default_sound": true,
            "default_vibrate_timings": false,
            "default_light_settings": true,
          }
        },
        "data": {
          "status":'done',
          "body":body,
          "title":title,
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
        }
      },
    );
  }
}
