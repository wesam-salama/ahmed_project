import 'package:digital_academy/screens/home/homeScreen.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsagePolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: primeryColor),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'سياسة الاستخدام',
            style: GoogleFonts.roboto(
                fontSize: 18, color: primeryColor, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Image.asset('assets/images/page1.png'),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: primeryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'سياسة الاستخدام يتوجب عليكم الموافقة على هذه البنود ("الأحكام") للدخول إلى هذا الموقع وتصفحه و/أو استخدامه. في حال عدم الموافقة على هذه الأحكام يتوجب عليكم مغادرة الموقع.  أولا:  الوصول إلى الموقع يصرح بالدخول إلى الموقع على أساس مؤقت ونحتفظ بحق سحب أو تعديل الموقع دون أي إشعار. لن نكون مسؤولين في حال عدم عمل الموقع لأي سبب في أي وقت أو لأية فترة. نقوم بجمع واستخدام المعلومات الشخصية وفق سياسة الخصوصية المعلنة بالموقع. نحتفظ دائما بحق منع استخدامكم الموقع وفق وما يراه القائمين من إخلال لاستخدام الخدمة المقدمة. ثانيا: الاستخدام غير المصرح به يجوز لكم استخدام هذا الموقع فقط لأغراض قانونية. ولا يجوز لكم استخدام الموقع فى حال شمل الاستخدام اى من الحالات التالية: إخلال بأية طريقة بأي قانون أو لائحة نافذة محلية أو وطنية أو دولية؛ استخدام غير قانوني أو بطريقة احتيالية أو لها أي غرض أو تأثير غير قانوني أو احتيالي؛ افترائية على أي شخص أو فاحشة أو مهينة أو مكروهة أو تحريضية؛ ترويج لأية مواد جنسية فاضحة أو تمييز من أي نوع؛ أوتنقل أو تتسبب في إرسال أية مواد دعائية أو ترويجية غير مرغوبة أو غير مصرح بها أو أي شكل أخر من المواد غير المرغوب بها (spam). رابعا: حقوق الملكية الفكرية جميع العلامات التجارية المذكورة بالموقع هى ملك لأصحابها ما لم يعلن غير ذلك، هذا الموقع محمي بحقوق النسخ والعلامات التجارية والبيانات وحقوق الملكية الفكرية ويتوجب عليكم الإقرار بأن هذه الحقوق هي جزء من الموقع وتبقى هذه الحقوق خاصة بنا أو بالمرخصين لنا.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
