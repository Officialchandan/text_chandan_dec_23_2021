import 'package:flutter/material.dart';
import 'package:text_chandan_23_dec/constant/colors.dart';
import 'package:text_chandan_23_dec/main.dart';
import 'package:text_chandan_23_dec/ui/store_details.dart';

import '../model/store_model.dart';

class StoresHomeScreen extends StatefulWidget {
  const StoresHomeScreen({Key? key}) : super(key: key);

  @override
  State<StoresHomeScreen> createState() => _StoresHomeScreenState();
}

class _StoresHomeScreenState extends State<StoresHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Stores",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "All Stores",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: apiReposotory.getBooksData(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      StoreModel? data = snapshot.data!;
                      return ListView.builder(
                          itemCount: data.result!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (data.result![index].userId == "18") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StoreDetails(
                                        data: data.result![index],
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .10,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade100, //New
                                      blurRadius: 10.0,
                                      offset: const Offset(
                                        5,
                                        8,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(23.0),
                                ),
                                child: Center(
                                  child: ListTile(
                                    leading: Container(
                                      height: 170,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200, //New
                                            blurRadius: 10.0,
                                            offset: const Offset(
                                              2,
                                              5,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(90.0),
                                      ),
                                      child: CircleAvatar(
                                        maxRadius: 160,
                                        backgroundImage: data
                                                .result![index].image!.isEmpty
                                            ? const NetworkImage(
                                                "https://www.shutterstock.com/image-vector/market-building-grocery-store-vector-600w-1624439218.jpg")
                                            : NetworkImage(
                                                data.result![index].image!),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data.result![index].storeName!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Icon(Icons.arrow_forward_ios,
                                            color: Colors.black, size: 20),
                                      ],
                                    ),
                                    subtitle: Text(
                                      data.result![index].storeAddress!,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: AppColors.primaryTextGray,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
