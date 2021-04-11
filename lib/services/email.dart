import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';

class Mail {
  String username = "lsyuan1029@gmail.com";
  String password = "Yuan2109@lsy";

  void sendMail() async{
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'yuan')
      ..recipients.add('lsyuan1029@gmail.com')
      ..subject = "Child Location ${DateTime.now()}"
      ..text = "Here";

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