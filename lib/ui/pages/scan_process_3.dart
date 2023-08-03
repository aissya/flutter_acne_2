import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/ui/pages/scan_process_3_detail.dart';
import 'package:flutter_acne/ui/pages/scan_process_3_detail_normalface.dart';

class ScanProcess3 extends StatefulWidget {
  const ScanProcess3({Key? key, required this.image, required this.pred})
      : super(key: key);
  final List? pred;
  final File? image;

  @override
  _ScanProcess3State createState() => _ScanProcess3State();
}

class _ScanProcess3State extends State<ScanProcess3> {
  bool isTips = true;
  List label = [
    'blackhead',
    'nodules',
    'normalface',
    'papula',
    'pustula',
  ];

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget customAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: bgColor,
        toolbarHeight: getProportionateScreenHeight(50),
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(40)),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: pinkColor,
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  'Result',
                  style: aclonicaTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: weightBold,
                    color: whiteColor,
                  ),
                ),
              ),
              Positioned(
                right: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(12),
                child: GestureDetector(
                  onTap: (() => Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false)),
                  child: Text(
                    'Done',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: weightBold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: customAppBar(),
        body: (widget.pred![0]['label'] == label[0])
            ? ScanProcess3Detail(
                image: widget.image,
                pengertian:
                    'Blackhead atau komedo hitam adalah tonjolan kecil berwarna gelap di kulit akibat tersumbatnya pori-pori. Blackhead umumnya muncul di wajah, tetapi bisa juga ditemukan di bagian tubuh lainnya, seperti punggung, dada, leher, bahu, dan tangan. Blackhead umumnya tidak menyebabkan nyeri layaknya jerawat dan mudah sekali terlihat di permukaan kulit karena warnanya yang gelap. Oleh sebab itu, jika tumbuh pada wajah, blackhead mungkin bisa mengganggu penampilan.',
                pengertianinggris:
                    'Blackheads are small dark bumps on the skin caused by clogged pores. Blackheads commonly appear on the face, but can also be found on other parts of the body, such as the back, chest, neck, shoulders and hands. Blackheads generally do not cause pain like acne and are easily visible on the surface of the skin due to their dark color. Therefore, if they grow on the face, blackheads may be a nuisance.',
                penyakit: 'blackhead',
                penyebab:
                    '\n1.Iritasi pada folikel rambut. \n2.Produksi minyak yang berlebih. \n3. Penumpukan bakteri Propionibacterium acnes di kulit. \n4.Perubahan hormon, misalnya saat menstruasi atau akibat mengonsumsi pil KB maupun obat-obatan tertentu',
                perawatan:
                    '\n1.Pilih produk perawatan kulit dengan asam salisilat (salicylic acid) untuk mengatasi blackhead dan membersihkan kulit. \n2.Gunakan krim atau losion retinoid untuk mengatasi blackhead dan meremajakan kulit. Gunakan produk ini sebelum tidur untuk hasil optimal. \n3.Melakukan chemical peeling menggunakan bahan seperti asam salisilat, asam glikolat, atau asam retinoat untuk menghilangkan blackhead dan meremajakan kulit dengan pengelupasan lapisan atas kulit. \n4.Terapi laser menggunakan laser untuk mengurangi produksi minyak dan membunuh bakteri pada kulit, tanpa merusak lapisan kulit atas.',
                penyebabinggris:
                    '\n1.Irritation of the hair follicles. \n2.Excess oil production. \n3. Buildup of Propionibacterium acnes bacteria on the skin. \n4.Hormonal changes, such as during menstruation or due to taking birth control pills or certain medications.',
                perawataninggris:
                    '\n1.Choose skincare products with salicylic acid to treat blackheads and clear the skin. \n2.Use a retinoid cream or lotion to treat blackheads and rejuvenate the skin. Use this product before bed for optimal results. \n3.Perform chemical peels using ingredients such as salicylic acid, glycolic acid, or retinoic acid to remove blackheads and rejuvenate the skin by exfoliating the top layer of skin. \n4.Laser therapy uses a laser to reduce oil production and kill bacteria on the skin, without damaging the top layer of skin.',
                disclaimer:
                    'Hasil yang didapatkan hanyalah sebuah prediksi. Konsultasikan dengan dokter untuk perawatan kulit wajah yang tepat.',
                disclaimeringgris:
                    'The results obtained are only a prediction. Consult a doctor for proper facial skin treatment.',
              )
            : (widget.pred![0]['label'] == label[1])
                ? ScanProcess3Detail(
                    image: widget.image,
                    pengertian:
                        'Jerawat nodul adalah jenis jerawat meradang yang terbentuk di lapisan bawah kulit. Jerawat ini umumnya lebih besar, lebih menyakitkan, dan lebih sulit dihilangkan daripada jenis jerawat lainnya. Penanganan langsung oleh dokter dapat membantu mengurangi risiko terjadinya bekas jerawat di kemudian hari.',
                    pengertianinggris:
                        'Acne nodules are a type of inflamed acne that forms in the lower layers of the skin. They are generally larger, more painful and harder to get rid of than other types of acne. Immediate treatment by a doctor can help reduce the risk of acne scars in the future.',
                    penyakit: 'nodules',
                    penyebab:
                        '\n1.Keringat berlebih, seperti pada penderita hiperhidrosis. \n2.Memakai kosmetik atau produk perawatan kulit yang menyumbat pori-pori, seperti yang berbahan dasar minyak. \n3.Memiliki anggota keluarga yang juga mudah mengalami jerawat nodul. \n4.Mengalami perubahan hormon seperti saat pubertas, menstruasi, hamil, dan menopause. \n5.Mengonsumsi jenis obat-obatan tertentu, seperti obat kortikosteroid. \n6.Mengalami sres atau kecemasan.',
                    perawatan:
                        'Untuk mengatasi jerawat nodul, Anda memerlukan penanganan medis dari dokter kulit. Berikut adalah jenis pengobatan yang dapat diberikan oleh dokter: \n\n1.Salep jerawat dokter mengandung asam salisilat, benzoil peroksida, retinoid, dan antibiotik. \n2.Jerawat nodul yang meluas diobati dengan antibiotik untuk mengurangi bakteri P. acne dan peradangan. Contoh antibiotik yang diresepkan adalah doxycycline, erythromycin, dan minocycline. \n3.Pil KB efektif untuk mengobati jerawat nodul yang terkait dengan perubahan hormon sebelum menstruasi. Hormon sintetis dalam pil KB mengurangi produksi minyak kulit, mengurangi risiko jerawat nodul. \n4.Isotretinoin, obat oles turunan vitamin A, digunakan jika pengobatan sebelumnya tidak berhasil. Obat ini membantu membasmi bakteri, mengurangi produksi minyak berlebih, mencegah pori-pori tersumbat, dan mengurangi peradangan pada jerawat nodul. \n5.Dokter dapat menyuntikkan kortikosteroid ke jerawat nodul yang besar dan sulit hilang. Suntikan ini membantu mengurangi peradangan dan mempercepat penyembuhan jerawat nodul. \n6.Laser wajah dapat mengurangi jerawat nodul dan bopeng dengan sinar khusus. Penanganan dapat dilakukan secara kombinasi untuk hasil yang optimal.',
                    penyebabinggris:
                        '\n1.Excessive sweating, such as in people with hyperhidrosis. \n2.Using cosmetics or skincare products that clog pores, such as oil-based ones. \n3.Having a family member who is also prone to acne nodules. \n4.Experiencing hormonal changes such as during puberty, menstruation, pregnancy, and menopause. \n5.Taking certain types of medications, such as corticosteroid drugs. Experiencing stress or anxiety.',
                    perawataninggris:
                        'To treat acne nodules, you will need medical treatment from a dermatologist. Here are the types of treatment that can be given by a doctor: \n\n1.Acne ointment contains salicylic acid, benzoyl peroxide, retinoids, and antibiotics. \n2.Widespread acne nodules are treated with antibiotics to reduce P. acne bacteria and inflammation. Examples of antibiotics prescribed are doxycycline, erythromycin, and minocycline. \n3.Birth control pills are effective for treating acne nodules associated with hormonal changes before menstruation. The synthetic hormones in birth control pills reduce skin oil production, reducing the risk of acne nodules. \n4.Isotretinoin, a vitamin A-derived topical medication, is used if previous treatments have not worked. It helps to eradicate bacteria, reduce excess oil production, prevent clogged pores, and reduce inflammation in acne nodules. \n5.Doctors may inject corticosteroids into large, hard-to-remove acne nodules. These injections help reduce inflammation and speed up the healing of acne nodules. \n6.Facial lasers can reduce acne nodules and pockmarks with a special beam. Treatment can be done in combination for optimal results.',
                    disclaimer:
                        'Hasil yang didapatkan hanyalah sebuah prediksi. Konsultasikan dengan dokter untuk perawatan kulit wajah yang tepat.',
                    disclaimeringgris:
                        'The results obtained are only a prediction. Consult a doctor for proper facial skin treatment.',
                  )
                : (widget.pred![0]['label'] == label[2])
                    ? ScanProcess3DetailNormalface(
                        image: widget.image,
                        pengertian:
                            'Kulit wajah normal adalah jenis kulit yang sehat dan seimbang secara optimal. Kulit ini memiliki tekstur halus, pori-pori kecil, dan tidak mengalami masalah kulit berlebihan seperti kekeringan atau kelebihan minyak. Kulit wajah normal cenderung terlihat segar, cerah, dan memiliki tingkat kelembapan yang baik.',
                        pengertianinggris:
                            'Normal facial skin is a type of skin that is optimally healthy and balanced. It has a smooth texture, small pores, and does not suffer from excessive skin problems such as dryness or excess oil. Normal skin tends to look fresh, bright and has good moisture levels.',
                        penyakit: 'normalface',
                        penyebab:
                            '\n1.Genetika \n2.Keseimbangan produksi minyak, menghasilkan cukup minyak untuk menjaga kelembapan kulit tanpa membuatnya terlalu berminyak. \n3.Kelembapan alami dapat menjaga kelembapan kulit dengan baik tanpa terlalu kering atau terlalu lembab. \n4.Perawatan yang tepat. \n5.Membersihkan wajah secara teratur, menggunakan pelembap yang sesuai, dan melindungi kulit dari sinar matahari dapat membantu menjaga keadaan kulit wajah normal. \n6. Gaya hidup sehat seperti pola makan yang seimbang, tidur yang cukup, dan menghindari stres berlebihan.',
                        perawatan:
                            '\n1.Tidak terlalu berminyak maupun terlalu kering. \n2.Tidak ada masalah kulit yang mencolok seperti jerawat atau peradangan. \n3.Poros-poros kulit terlihat kecil dan tidak tersumbat. \n4.Kulit terasa lembut dan kenyal. \n5.Warna kulit merata tanpa bintik-bintik atau kemerahan yang berlebihan. \n6.Tidak ada masalah sensitivitas yang signifikan terhadap produk atau rangsangan eksternal.',
                        penyebabinggris:
                            '\n1.Genetics \n2.Oil production balance, producing enough oil to keep the skin moisturized without making it too oily. \n3.Natural moisture can keep the skin well moisturized without being too dry or too moist. \n4.Proper care. \n5.Cleaning the face regularly, using an appropriate moisturizer, and protecting the skin from the sun can help maintain the normal state of facial skin. \n6. A healthy lifestyle such as a balanced diet, adequate sleep, and avoiding excessive stress.',
                        perawataninggris:
                            '\n1.Neither too oily nor too dry. \n2.There are no noticeable skin problems such as acne or inflammation. \n3.Skin shafts look small and unclogged. \n4.The skin feels soft and supple. \n5.Skin color is even without spots or excessive redness. \n6.There are no significant sensitivity issues to products or external stimuli.',
                        disclaimer:
                            'Hasil yang didapatkan hanyalah sebuah prediksi. Konsultasikan dengan dokter untuk perawatan kulit wajah yang tepat.',
                        disclaimeringgris:
                            'The results obtained are only a prediction. Consult a doctor for proper facial skin treatment.',
                        tips:
                            '\n1.Rutin membersihkan wajah dua kali sehari untuk menghilangkan kotoran dan minyak. \n2.Hindari menyentuh wajah dengan tangan kotor. \n3.Hindari pemakaian kosmetik berlebihan. \n4.Gunakan pelembap sesuai jenis kulit Anda. \n5.Konsumsi makanan sehat seperti buah-buahan dan sayuran. \n6.Hindari stres berlebihan. \n7.Gunakan produk Anti-Jerawat cari produk dengan asam salisilat atau tea tree oil. \n8.Jangan memencet jerawat untuk menghindari peradangan.',
                        tipsinggris:
                            '\n1.Clean your face twice a day to remove dirt and oil. \n2.Avoid touching your face with dirty hands. \n3.Avoid wearing excessive cosmetics. \n4.Use moisturizer according to your skin type. \n5.Consume healthy foods such as fruits and vegetables. \n6.Avoid excessive stress. \n7.Use anti-acne products, look for products with salicylic acid or tea tree oil. \n8.Do not squeeze pimples to avoid inflammation.',
                      )
                    : (widget.pred![0]['label'] == label[3])
                        ? ScanProcess3Detail(
                            image: widget.image,
                            pengertian:
                                'Jerawat papula adalah jerawat yang menonjol, kecil, padat, tampak kemerahan, dan tidak mengandung nanah. Meski bukanlah kondisi yang serius, jerawat ini dapat mengganggu penampilan. Sama seperti jerawat pada umumnya, jerawat papula muncul karena penyumbatan dan peradangan di pori-pori wajah. Jerawat ini ditandai dengan munculnya benjolan padat dengan ukuran kurang dari 1 cm.',
                            pengertianinggris:
                                'Papules are pimples that are prominent, small, dense, reddish in appearance, and do not contain pus. Although not a serious condition, these pimples can be a nuisance. Just like acne in general, acne papules appear due to blockage and inflammation in the pores of the face. These pimples are characterized by the appearance of solid lumps less than 1 cm in size.',
                            penyakit: 'papula',
                            penyebab:
                                '\n1.Pengaruh hormonal \n2.Produksi minyak di wajah yang berlebih. \n3.Penyumbatan di folikel rambut dan kelenjar minyak. \n4.Terlalu banyak konsumsi makanan manis. \n5.Stres  \n6.Infeksi bakteri Propionibacterium acnes di permukaan kulit akibat pori-pori tersumbat. ',
                            perawatan:
                                '\n1.Cuci wajah dan tubuh secara rutin untuk mengatasi jerawat papula. Hindari mencuci wajah terlalu sering agar tidak iritasi. \n2.Jangan menyentuh atau memecahkan jerawat papula. Tindakan tersebut bisa memperburuk peradangan dan meninggalkan bekas luka. \n3.Hindari penggunaan losion dan make-up pada area jerawat. Gunakan produk yang sudah teruji dan cocok untuk kulit Anda. \n4.Bersihkan rambut secara rutin dan hindari model rambut berponi.',
                            penyebabinggris:
                                '\n1.Hormonal influence \n2.Excessive oil production on the face. \n3.Blockage in hair follicles and oil glands. \n4.Consumption of too many sweets. \n5.Stress \n6.Infection of Propionibacterium acnes bacteria on the skin surface due to clogged pores.',
                            perawataninggris:
                                '\n1.Wash your face and body regularly to treat acne papules. Avoid washing your face too often to avoid irritation. \n2.Do not touch or break the papules. Doing so can worsen inflammation and leave scars. \n3.Avoid using lotions and make-up on the acne area. Use products that have been tested and are suitable for your skin. \n4.Clean your hair regularly and avoid bangs.',
                            disclaimer:
                                'Hasil yang didapatkan hanyalah sebuah prediksi. Konsultasikan dengan dokter untuk perawatan kulit wajah yang tepat.',
                            disclaimeringgris:
                                'The results obtained are only a prediction. Consult a doctor for proper facial skin treatment.',
                          )
                        : ScanProcess3Detail(
                            image: widget.image,
                            pengertian:
                                'Jerawat pustula adalah jenis jerawat yang berisi nanah. Meski dapat sembuh dengan sendirinya, mengoleskan obat jerawat maupun penanganan dari dokter dapat membantu mempercepat penyembuhan jerawat pustula. Jerawat pustula muncul sebagai benjolan meradang berwarna kemerahan dengan bagian tengah berwarna putih. Ukuran jerawat ini dapat bervariasi, mulai dari kecil hingga besar, serta terasa nyeri ketika disentuh.',
                            pengertianinggris:
                                'Pustules are a type of acne that contains pus. Although they can heal on their own, applying acne medication and getting treatment from a doctor can help speed up the healing of acne pustules. Pustules appear as reddish inflamed bumps with a white center. They can vary in size from small to large, and are painful to the touch.',
                            penyakit: 'pustula',
                            penyebab:
                                '\n1.Kurang menjaga kebersihan kulit. \n2.Menggunakan kosmetik yang berbahan dasar minyak sehingga dapat menyumbat pori. \n3.Mengonsumsi makan tinggi gula. \n4.Mengonsumsi obat-obatan tertentu, termasuk dari golongan kortikosteroid. \n5.Merokok. \n6.Menderita stres. \n7.Memiliki anggota keluarga dengan keluhan serupa atau karena faktor genetik',
                            perawatan:
                                'Untuk menghilangkan jerawat pustula lebih cepat, ada beberapa cara yang bisa Anda lakukan, yaitu: \n\n1.Salep jerawat mengandung asam salisilat, benzoil peroksida, retinoid, dan antibiotik. Salep ini digunakan untuk mengatasi jerawat ringan hingga sedang. Untuk jerawat parah, konsultasikan dengan dokter. \n2.Jika jerawat tidak membaik setelah menggunakan salep, dokter dapat meresepkan obat jerawat minum, seperti antibiotik atau isotretinoin, tergantung pada tingkat keparahan jerawat. \n3.Fototerapi menggunakan cahaya khusus untuk mengatasi jerawat pustula yang sulit diobati. Metode ini membunuh bakteri penyebab jerawat dan mengurangi produksi minyak.',
                            penyebabinggris:
                                '\n1.Lack of skin hygiene. \n2.Using oil-based cosmetics that clog pores. \n3.Eating foods high in sugar. \n4.Taking certain medications, including corticosteroids. Smoking. \n5.Suffering from stress. \n6.Having family members with similar complaints or due to genetic factors',
                            perawataninggris:
                                'To get rid of acne pustules faster, there are several ways you can do: \n\n1.Acne ointment contains salicylic acid, benzoyl peroxide, retinoids, and antibiotics. These ointments are used to treat mild to moderate acne. For severe acne, consult a doctor. \n2.If the acne does not improve after using ointments, the doctor may prescribe over-the-counter acne medications, such as antibiotics or isotretinoin, depending on the severity of the acne. \n3.Phototherapy uses a special light to treat hard-to-treat pustular acne. This method kills acne-causing bacteria and reduces oil production.',
                            disclaimer:
                                'Hasil yang didapatkan hanyalah sebuah prediksi. Konsultasikan dengan dokter untuk perawatan kulit wajah yang tepat.',
                            disclaimeringgris:
                                'The results obtained are only a prediction. Consult a doctor for proper facial skin treatment.',
                          ),
      ),
    );
  }
}
