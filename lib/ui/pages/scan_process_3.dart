import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/ui/pages/scan_process_3_detail.dart';

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
                sDetail:
                    'Blackhead atau komedo hitam adalah tonjolan kecil berwarna gelap di kulit akibat tersumbatnya pori-pori.',
                lDetail:
                    'Blackhead atau komedo hitam adalah tonjolan kecil berwarna gelap di kulit akibat tersumbatnya pori-pori. Blackhead umumnya muncul di wajah, tetapi bisa juga ditemukan di bagian tubuh lainnya, seperti punggung, dada, leher, bahu, dan tangan. Blackhead umumnya tidak menyebabkan nyeri layaknya jerawat dan mudah sekali terlihat di permukaan kulit karena warnanya yang gelap. Oleh sebab itu, jika tumbuh pada wajah, blackhead mungkin bisa mengganggu penampilan.',
                penyakit: 'blackhead',
                penyebab:
                    '\n1.Iritasi pada folikel rambut. \n2.Produksi minyak yang berlebih. \n3. Penumpukan bakteri Propionibacterium acnes di kulit. \n4.Perubahan hormon, misalnya saat menstruasi atau akibat mengonsumsi pil KB maupun obat-obatan tertentu',
                perawatan:
                    '\n1.Pilih produk perawatan kulit dengan asam salisilat (salicylic acid) untuk mengatasi blackhead dan membersihkan kulit. \n2.Gunakan krim atau losion retinoid untuk mengatasi blackhead dan meremajakan kulit. Gunakan produk ini sebelum tidur untuk hasil optimal. \n3.Melakukan chemical peeling menggunakan bahan seperti asam salisilat, asam glikolat, atau asam retinoat untuk menghilangkan blackhead dan meremajakan kulit dengan pengelupasan lapisan atas kulit. \n4.Terapi laser menggunakan laser untuk mengurangi produksi minyak dan membunuh bakteri pada kulit, tanpa merusak lapisan kulit atas.',
              )
            : (widget.pred![0]['label'] == label[1])
                ? ScanProcess3Detail(
                    image: widget.image,
                    sDetail:
                        'Jerawat nodul adalah jenis jerawat meradang yang terbentuk di lapisan bawah kulit.',
                    lDetail:
                        'Jerawat nodul adalah jenis jerawat meradang yang terbentuk di lapisan bawah kulit. Jerawat ini umumnya lebih besar, lebih menyakitkan, dan lebih sulit dihilangkan daripada jenis jerawat lainnya. Penanganan langsung oleh dokter dapat membantu mengurangi risiko terjadinya bekas jerawat di kemudian hari.',
                    penyakit: 'nodules',
                    penyebab:
                        '\n1.Keringat berlebih, seperti pada penderita hiperhidrosis. \n2.Memakai kosmetik atau produk perawatan kulit yang menyumbat pori-pori, seperti yang berbahan dasar minyak. \n3.Memiliki anggota keluarga yang juga mudah mengalami jerawat nodul. \n4.Mengalami perubahan hormon seperti saat pubertas, menstruasi, hamil, dan menopause. \n5.Mengonsumsi jenis obat-obatan tertentu, seperti obat kortikosteroid. \n6.Mengalami sres atau kecemasan.',
                    perawatan:
                        'Untuk mengatasi jerawat nodul, Anda memerlukan penanganan medis dari dokter kulit. Berikut adalah jenis pengobatan yang dapat diberikan oleh dokter: \n\n1.Salep jerawat dokter mengandung asam salisilat, benzoil peroksida, retinoid, dan antibiotik. \n2.Jerawat nodul yang meluas diobati dengan antibiotik untuk mengurangi bakteri P. acne dan peradangan. Contoh antibiotik yang diresepkan adalah doxycycline, erythromycin, dan minocycline. \n3.Pil KB efektif untuk mengobati jerawat nodul yang terkait dengan perubahan hormon sebelum menstruasi. Hormon sintetis dalam pil KB mengurangi produksi minyak kulit, mengurangi risiko jerawat nodul. \n4.Isotretinoin, obat oles turunan vitamin A, digunakan jika pengobatan sebelumnya tidak berhasil. Obat ini membantu membasmi bakteri, mengurangi produksi minyak berlebih, mencegah pori-pori tersumbat, dan mengurangi peradangan pada jerawat nodul. \n5.Dokter dapat menyuntikkan kortikosteroid ke jerawat nodul yang besar dan sulit hilang. Suntikan ini membantu mengurangi peradangan dan mempercepat penyembuhan jerawat nodul. \n6.Laser wajah dapat mengurangi jerawat nodul dan bopeng dengan sinar khusus. Penanganan dapat dilakukan secara kombinasi untuk hasil yang optimal.',
                  )
                : (widget.pred![0]['label'] == label[2])
                    ? ScanProcess3Detail(
                        image: widget.image,
                        sDetail:
                            'Kulit wajah normal adalah jenis kulit yang sehat dan seimbang secara optimal.',
                        lDetail:
                            'Kulit wajah normal adalah jenis kulit yang sehat dan seimbang secara optimal. Kulit ini memiliki tekstur halus, pori-pori kecil, dan tidak mengalami masalah kulit berlebihan seperti kekeringan atau kelebihan minyak. Kulit wajah normal cenderung terlihat segar, cerah, dan memiliki tingkat kelembapan yang baik.',
                        penyakit: 'normalface',
                        penyebab:
                            '\n1.Genetika \n2.Keseimbangan produksi minyak, menghasilkan cukup minyak untuk menjaga kelembapan kulit tanpa membuatnya terlalu berminyak. \n3.Kelembapan alami dapat menjaga kelembapan kulit dengan baik tanpa terlalu kering atau terlalu lembab. \n4.Perawatan yang tepat. \n5.Membersihkan wajah secara teratur, menggunakan pelembap yang sesuai, dan melindungi kulit dari sinar matahari dapat membantu menjaga keadaan kulit wajah normal. \n6. Gaya hidup sehat seperti pola makan yang seimbang, tidur yang cukup, dan menghindari stres berlebihan.',
                        perawatan:
                            '\n1.Tidak terlalu berminyak maupun terlalu kering. \n2.Tidak ada masalah kulit yang mencolok seperti jerawat atau peradangan. \n3.Poros-poros kulit terlihat kecil dan tidak tersumbat. \n4.Kulit terasa lembut dan kenyal. \n5.Warna kulit merata tanpa bintik-bintik atau kemerahan yang berlebihan. \n6.Tidak ada masalah sensitivitas yang signifikan terhadap produk atau rangsangan eksternal.',
                      )
                    : (widget.pred![0]['label'] == label[3])
                        ? ScanProcess3Detail(
                            image: widget.image,
                            sDetail:
                                'Jerawat papula adalah jerawat yang menonjol, kecil, padat, tampak kemerahan, dan tidak mengandung nanah.',
                            lDetail:
                                'Jerawat papula adalah jerawat yang menonjol, kecil, padat, tampak kemerahan, dan tidak mengandung nanah. Meski bukanlah kondisi yang serius, jerawat ini dapat mengganggu penampilan. Sama seperti jerawat pada umumnya, jerawat papula muncul karena penyumbatan dan peradangan di pori-pori wajah. Jerawat ini ditandai dengan munculnya benjolan padat dengan ukuran kurang dari 1 cm.',
                            penyakit: 'papula',
                            penyebab:
                                '\n1.Pengaruh hormonal \n1.Infeksi bakteri Propionibacterium acnes di permukaan kulit akibat pori-pori tersumbat. \n2.Produksi minyak di wajah yang berlebih. \n3.Penyumbatan di folikel rambut dan kelenjar minyak. \n4.Terlalu banyak konsumsi makanan manis. \n5.Stres',
                            perawatan:
                                '\n1.Cuci wajah dan tubuh secara rutin untuk mengatasi jerawat papula. Hindari mencuci wajah terlalu sering agar tidak iritasi. \n2.Jangan menyentuh atau memecahkan jerawat papula. Tindakan tersebut bisa memperburuk peradangan dan meninggalkan bekas luka. \n3.Hindari penggunaan losion dan make-up pada area jerawat. Gunakan produk yang sudah teruji dan cocok untuk kulit Anda. \n4.Bersihkan rambut secara rutin dan hindari model rambut berponi.',
                          )
                        : ScanProcess3Detail(
                            image: widget.image,
                            sDetail:
                                'Jerawat pustula adalah jenis jerawat yang berisi nanah.',
                            lDetail:
                                'Jerawat pustula adalah jenis jerawat yang berisi nanah. Meski dapat sembuh dengan sendirinya, mengoleskan obat jerawat maupun penanganan dari dokter dapat membantu mempercepat penyembuhan jerawat pustula. Jerawat pustula muncul sebagai benjolan meradang berwarna kemerahan dengan bagian tengah berwarna putih. Ukuran jerawat ini dapat bervariasi, mulai dari kecil hingga besar, serta terasa nyeri ketika disentuh.',
                            penyakit: 'pustula',
                            penyebab:
                                '\n1.Kurang menjaga kebersihan kulit. \n2.Menggunakan kosmetik yang berbahan dasar minyak sehingga dapat menyumbat pori. \n3.Mengonsumsi makan tinggi gula. \n4.Mengonsumsi obat-obatan tertentu, termasuk dari golongan kortikosteroid. \n5.Merokok. \n6.Menderita stres. \n7.Memiliki anggota keluarga dengan keluhan serupa atau karena faktor genetik',
                            perawatan:
                                'Untuk menghilangkan jerawat pustula lebih cepat, ada beberapa cara yang bisa Anda lakukan, yaitu: \n\n1.Salep jerawat mengandung asam salisilat, benzoil peroksida, retinoid, dan antibiotik. Salep ini digunakan untuk mengatasi jerawat ringan hingga sedang. Untuk jerawat parah, konsultasikan dengan dokter. \n2.Jika jerawat tidak membaik setelah menggunakan salep, dokter dapat meresepkan obat jerawat minum, seperti antibiotik atau isotretinoin, tergantung pada tingkat keparahan jerawat. \n3.Fototerapi menggunakan cahaya khusus untuk mengatasi jerawat pustula yang sulit diobati. Metode ini membunuh bakteri penyebab jerawat dan mengurangi produksi minyak.',
                          ),
      ),
    );
  }
}
