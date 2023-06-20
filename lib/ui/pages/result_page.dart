import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/ui/pages/detail_result_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.image, required this.pred})
      : super(key: key);
  final List? pred;
  final File? image;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
        backgroundColor: whiteColor,
        toolbarHeight: getProportionateScreenHeight(60),
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(23)),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
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
                top: getProportionateScreenHeight(20),
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
            ? DetailResultPage(
                image: widget.image,
                sDetail:
                    'blackhead Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                lDetail:
                    'blackhead Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem',
                penyakit: 'blackhead',
                tips:
                    'Beberapa upaya yang dapat dilakukan untuk mencegah jerawat yaitu\n\n1. Membersihkan riasan wajah sebelum tidur.\n2. Mengelola stres dengan baik\n3. Menghindari penggunaan pakaian yang terlalu ketat.\n4. Menjaga kebersihan tubuh dengan selalu mandi setelah beraktivitas.\n5. Menghindari memencet dan memegang jerawat, karena dapat memicu jerawat bertambah banyak.\n6. Menjaga kebersihan wajah dengan membersihkan wajah dua kali dalam sehari, untuk mengangkat sel-sel kulit mati, minyak yang berlebihan, serta sisa kosmetik di permukaan kulit.',
                medicine: [
                  'assets/obat_jerawat1.png',
                  'assets/obat_jerawat2.png',
                  'assets/obat_jerawat3.png',
                  'assets/obat_jerawat4.png'
                ],
              )
            : (widget.pred![0]['label'] == label[1])
                ? DetailResultPage(
                    image: widget.image,
                    sDetail:
                        'nodules Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    lDetail:
                        'nodules Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem',
                    penyakit: 'nodules',
                    tips:
                        'Ada beberapa cara yang bisa dilakukan untuk mencegah infestasi ulang dan mencegah penyebaran penyakit ini pada orang lain, yaitu:\n\n1. Membersihkan pakaian dengan benar. Gunakan air sabun panas untuk mencuci semua pakaian, handuk, dan seprai yang digunakan dalam waktu tiga hari sebelum perawatan dilakukan. Keringkan pakaian tersebut dengan panas tinggi.\n\n2. Pisahkan barang yang tidak bisa dicuci. Cobalah untuk memisahkan barang-barang yang tidak dapat dicuci ke dalam kantong plastik tertutup dan letakkan di tempat yang terpisah, seperti garasi. Diamkan selama beberapa minggu agar tungau mati setelah beberapa hari tidak mendapatkan makanan.',
                    medicine: [
                      'assets/obat_kudis1.png',
                      'assets/obat_kudis2.png',
                      'assets/obat_kudis3.png',
                      'assets/obat_kudis4.png'
                    ],
                  )
                : (widget.pred![0]['label'] == label[2])
                    ? DetailResultPage(
                        image: widget.image,
                        sDetail:
                            'normalface Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        lDetail:
                            'normalface Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem',
                        penyakit: 'normalface',
                        tips:
                            'Berikut adalah beberapa upaya yang dapat dilakukan untuk mencegah dermatitis kontak:\n\n1. Hindari iritan dan alergen. Cobalah untuk mengidentifikasi dan menghindari zat yang mengiritasi kulit atau menyebabkan reaksi alergi.\n\n2. Cuci kulit. Kamu bisa menghilangkan sebagian besar zat penyebab ruam jika segera mencuci kulit setelah bersentuhan dengannya. Gunakan sabun lembut, bebas pewangi, air hangat, dan bilas sepenuhnya. \n\n3. Cuci pakaian atau barang lain yang mungkin terkena alergen tanaman.\n\n4. Kenakan pakaian pelindung atau sarung tangan. Masker wajah, kacamata, sarung tangan, dan barang pelindung lainnya dapat melindungi kami dari zat yang mengiritasi. Termasuk cairan pembersih rumah.\n\n5. Gunakan penutup untuk menutup logam bersentuhan dengan kulit. Ini bisa menghindari paparan dari kancing celana jeans atau resleting yang terbuat dari logam.',
                        medicine: [
                          'assets/obat_dermatitis1.png',
                          'assets/obat_dermatitis2.png',
                          'assets/obat_dermatitis3.png',
                          'assets/obat_dermatitis4.png'
                        ],
                      )
                    : (widget.pred![0]['label'] == label[3])
                        ? DetailResultPage(
                            image: widget.image,
                            sDetail:
                                'papula Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            lDetail:
                                'papula Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem',
                            penyakit: 'papula',
                            tips:
                                'Selain menggunakan obat anti jamur, pengidap dapat melakukan beberapa hal berikut ini untuk membantu mengatasi kurap:\n\n1. Tidak memakai pakaian dengan bahan yang bisa memicu iritasi pada area kurap.\n\n2. Mencuci baju dan sprei setiap hari selama kurap belum sembuh sepenuhnya.\n\n3. Menjaga kebersihan lingkungan rumah dan sekitar.\n\n4. Menjaga kebersihan dan mengeringkan kulit secara teratur, terutama pada area yang terinfeksi kurap.\n\n5. Segera membawa hewan peliharaan ke dokter apabila terkena kurap.\n\n6. Sebisa mungkin tidak menggaruk area tubuh yang terasa gatal.\n\n7. Langsung bertanya pada dokter kulit apabila kurap tidak membaik selama lebih dari dua minggu. ',
                            medicine: [
                              'assets/obat_kurap1.png',
                              'assets/obat_kurap2.png',
                              'assets/obat_kurap3.png',
                              'assets/obat_kurap4.png'
                            ],
                          )
                        : DetailResultPage(
                            image: widget.image,
                            sDetail:
                                'pustula Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            lDetail:
                                'pustula Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem',
                            penyakit: 'pustula',
                            tips:
                                'Ada beberapa cara yang dapat dilakukan untuk menurunkan risiko masalah kulit ini dan mencegah penyebarannya pada orang lain. \n\nKetahui beberapa cara pencegahannya, antara lain:\n1.Hindari kontak dengan kutil (diri sendiri maupun orang lain).\n2.Jaga kebersihan tangan.\n3.Jaga tubuh agar tidak lembap.\n4.Memakai alas kaki di tempat umum.\n5.Hindari menggaruk kutil.',
                            medicine: [
                              'assets/obat_kutil1.png',
                              'assets/obat_kutil2.png',
                              'assets/obat_kutil3.png',
                              'assets/obat_kutil4.png'
                            ],
                          ),
      ),
    );
  }
}
