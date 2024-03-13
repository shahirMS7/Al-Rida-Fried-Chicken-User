import 'package:alridafrieds/controller/user_controller.dart';
import 'package:alridafrieds/user/menu/ItemDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpOffer extends StatelessWidget {
  const SpOffer({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: Consumer<UserController>(builder: (context, spOfferController, _) {
        return FutureBuilder(
            future: spOfferController.fetchProducts(
                'special offers', spOfferController.specialproductsList),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : spOfferController.specialproductsList.isEmpty
                      ? const Center(
                          child: Text('No Items'),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              spOfferController.specialproductsList.length,
                          separatorBuilder: (context, index) => SizedBox(
                              height: Height * 0.01), // Add a gap between items
                          itemBuilder: (context, index) {
                            return InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => items[index]['page'],
                              //       ));
                              // },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Width * 0.03),
                                ),
                                height: Height * 0.39,
                                child: Column(
                                  children: [
                                    Container(
                                      //image container
                                      margin: EdgeInsets.symmetric(
                                          horizontal: Width * 0.01,
                                          vertical: Height * 0.005),
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              spOfferController
                                                  .specialproductsList[index]
                                                  .productImage,
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: Width * 0.02,
                                        ),
                                        Text(
                                          spOfferController
                                              .specialproductsList[index]
                                              .productTitle,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Height * 0.025,
                                          ),
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          'assets/icons/non-veg.png',
                                          width: Height * 0.02,
                                        ),
                                        SizedBox(
                                          width: Width * 0.02,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Height * 0.01),
                                    SizedBox(
                                      height: Height * 0.065,
                                      width: Width * 0.95,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          spOfferController.addtoCart(
                                              spOfferController
                                                  .specialproductsList[index]
                                                  .productID,
                                              spOfferController
                                                  .specialproductsList[index]
                                                  .productTitle,
                                              spOfferController
                                                  .specialproductsList[index]
                                                  .productDescription,
                                              spOfferController
                                                  .specialproductsList[index]
                                                  .productPrice,
                                              1,
                                              context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff3c8a3c),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Adjust the radius as needed
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Add',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              '₹ ${spOfferController.specialproductsList[index].productPrice.toString()}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
            });
      }),
    );
  }
}
