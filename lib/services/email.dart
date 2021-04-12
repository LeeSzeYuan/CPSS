import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:geolocator/geolocator.dart';

class Mail {
  String username = "lsyuan1029@gmail.com";
  String password = "Yuan2109@lsy";
  void sendMail() async {
    final smtpServer = gmail(username, password);

    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final message = Message()
      ..from = Address(username, 'yuan')
      ..recipients.add('lsyuan1029@gmail.com')
      ..subject = "Your Child Location"
      ..html = "<p>On ${DateTime.now()} Your child location is at (${position.latitude},${position.longitude})</p><br><a href ='https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}'>https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}</a><br><p>Please confirm the safetiness of your child</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
