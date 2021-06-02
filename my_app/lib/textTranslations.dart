import 'package:get/get.dart';

class TextTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'app_name': 'SIRICHAI',
          'login': 'Login',
          'register': 'Register',
          'noneacc': 'You do not have an account to access it yet?',
          'help': 'Need help?',
          'click': 'Click here',
          'slectLang': 'Select Language',
          'th': 'Thailand',
          'en': 'English'
        },
        'th': {
          'app_name': 'ศิริชัย',
          'login': 'เข้าสู่ระบบ',
          'register': 'สมัครเข้าใช้งาน',
          'noneacc': 'คุณยังไม่มีบัญชีสำหรับเข้าใช้งานใช้หรือไม่',
          'help': 'ต้องการความช่วยเหลือ',
          'click': 'คลิก',
          'slectLang': 'เลือกภาษา',
          'th': 'ภาษาไทย',
          'en': 'ภาษาอังกฤษ'
        }
      };
}
