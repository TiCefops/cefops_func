import 'package:cefops_func/app/controller/home_controller.dart';
import 'package:cefops_func/app/data/model/employyees_model.dart';
import 'package:cefops_func/app/widgets/card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@immutable
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final data = Get.parameters;
  late String? userId;

  @override
  Widget build(BuildContext context) {
    final String userId = data["userid"] ?? "Jtxx9whjSSxYYyNHG0Wr";
    return Material(
      color: const Color(0xff15355c),
      child: GetPlatform.isMobile
          ? homeModelForMobile()
          : Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/fundo.png"),
                      opacity: 0.2,
                      alignment: Alignment.bottomRight)),
              child: FutureBuilder(
                future: controller.getEmployeById(userId),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  return LayoutBuilder(

                    builder:
                        (BuildContext context, BoxConstraints constraints,  ) {
                      if (snapshot.hasData) {
                        if (snapshot.data?.data() == null) {
                          return const Center(
                              child: Text("Usuário não encontrado "));
                        } else {
                          EmployyeesModel data =
                              EmployyeesModel.fromJson(snapshot.data!.data());
                          return modelForPc(constraints, data);
                        }
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Erro ao Bucar dados "),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
            ),
    );
  }
///tela para pc
  Widget modelForPc(BoxConstraints constraints, EmployyeesModel data) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 700),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/logo.png",
              ),
              scale: 5,
              alignment: Alignment.topLeft),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width:constraints.maxWidth <=700? constraints.maxWidth*0.6:Get.width*0.24 ,
                    height: constraints.maxHeight * 0.7,
                    child: CustomPaint(
                      painter: CardPath(),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.2,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.3,
                    child: Image.network(
                      "${data.linkImg}",
                      width:constraints.maxWidth <=700? constraints.maxWidth * 0.30:constraints.maxWidth * 0.12,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.038,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: constraints.maxHeight * 0.1,
                      child: Text(
                        "${data.nome}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: constraints.maxHeight * 0.1,
                      child: Text(
                        "${data.cargo}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: constraints.maxHeight * 0.01,
                      child: Text(
                        "Contratado em: ${data.dataCotntratado}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: constraints.maxWidth <=500? constraints.maxWidth*0.6:Get.width*0.24 ,
                      height: constraints.maxHeight * 0.15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Funcionario: ${controller.statusCheck(data.ativo ?? false)}",
                          style: TextStyle(
                              color:
                                  controller.colorChange(data.ativo ?? false),
                              fontWeight: FontWeight.w700,
                              fontSize:constraints.maxWidth <=700? constraints.maxWidth * 0.024: constraints.maxWidth * 0.015),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
///tela para mobile
  Widget homeModelForMobile() {
    final String userId = data["userid"] ?? "Jtxx9whjSSxYYyNHG0Wr";
    return Center(
      child: FutureBuilder(
        future: controller.getEmployeById(userId),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              backgroundColor: Colors.amber,
            );
          }
          if (snapshot.hasData) {
            EmployyeesModel data =
                EmployyeesModel.fromJson(snapshot.data!.data());
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      opacity: 0.2,
                      scale: 5,
                      alignment: Alignment.topCenter)),
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.9,
                          height: Get.height * 0.7,
                          child: CustomPaint(
                            painter: CardPath(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: Get.height * 0.15,
                        ),
                        SizedBox(
                          height: Get.height * 0.3,
                          child: Image.network(
                            "${data.linkImg}",
                            width: Get.width * 0.43,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.065,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: Get.height * 0.1,
                            child: Text(
                              "${data.nome}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: Get.height * 0.1,
                            child: Text(
                              "${data.cargo}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: Get.height * 0.01,
                            child: Text(
                              "Contratado em: ${data.dataCotntratado}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: Get.width * 0.9,
                            height: Get.height * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Funcionario: ${controller.statusCheck(data.ativo ?? false)}",
                                style: TextStyle(
                                    color: controller
                                        .colorChange(data.ativo ?? false),
                                    fontWeight: FontWeight.w700,
                                    fontSize: Get.width * 0.045),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (snapshot.data?.data() == null) {
            return const Center(child: Text("Usuário não encontrado "));
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
