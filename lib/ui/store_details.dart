import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_chandan_23_dec/constant/colors.dart';
import 'package:text_chandan_23_dec/ui/create_schedule_screen.dart';

import '../model/store_model.dart';

class StoreDetails extends StatefulWidget {
  final Result? data;
  const StoreDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();

  @override
  void initState() {
    shopNameController.text = widget.data!.storeName!;
    shopAddressController.text = widget.data!.storeAddress!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop('');
          },
          icon: const Icon(Icons.arrow_back, size: 25),
          color: Colors.white,
        ),
        title: Text(
          widget.data!.storeName!,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_calendar, size: 25),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: TextFormField(
                controller: shopNameController,
                decoration: const InputDecoration(
                    label: Text("Store Name"), border: UnderlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextFormField(
                controller: shopNameController,
                decoration: const InputDecoration(
                    label: Text("Store Address"),
                    border: UnderlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              color: AppColors.myPrimaryColors,
              minWidth: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: const Text(
                "Create Schedule",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateScheduleScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
