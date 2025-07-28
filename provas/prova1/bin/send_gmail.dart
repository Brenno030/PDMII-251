import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> enviarEmail(String conteudoJson) async {
  final smtpServer = gmail('brenno.nogueira09@aluno.ifce.edu.br', 'nnbkitqcpwnccsvg');

  final message = Message()
    ..from = Address('brenno.nogueira09@aluno.ifce.edu.br', 'Brenno Nogueira da Silva')
    ..recipients.add('taveira@ifce.edu.br')
    ..subject = 'Prova Prática - 01'
    ..text = 'Abaixo o JSON do pedido:\n\n$conteudoJson';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado com sucesso: $sendReport');
  } on MailerException catch (e) {
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}
