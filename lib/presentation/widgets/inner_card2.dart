import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/promo_code.dart';
import '../../logic/cubit/promo_code_cubit.dart';

class InnerCard2 extends StatefulWidget {
  const InnerCard2({super.key, required this.height, required this.size,});
  final double height;
  final Size size;

  @override
  State<InnerCard2> createState() => _InnerCard2State();
}

class _InnerCard2State extends State<InnerCard2> {
  int isTapped = 0;
  late PromoCode usedCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.53,
      width: double.infinity,
      padding: const EdgeInsets.only(
        bottom: 25,
        left: 25,
        right: 25,
        top: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: widget.height * 0.3,
            width: double.infinity,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                  child: BlocBuilder<PromoCodeCubit, PromoCodeState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: state.promocodes.map(
                          (e) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  isTapped = e.id;
                                  // e.ontap = !e.ontap;
                                  // e.ontap ? isTapped = e.id : isTapped = 0;
                                  usedCode = e;
                                });
                                print('${e.code} is used');
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: widget.height * 0.02,
                                ),
                                padding:
                                    EdgeInsets.only(right: widget.size.width * 0.08),
                                width: double.infinity,
                                height: widget.height * 0.05,
                                decoration: BoxDecoration(
                                  border: isTapped == e.id
                                      ? Border.all(
                                          color: const Color.fromRGBO(
                                              59, 196, 89, 1))
                                      : null,
                                  color: const Color.fromRGBO(227, 227, 227, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: double.infinity,
                                      width: widget.size.width * 0.25,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            197, 197, 197, 1),
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        e.code,
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      e.description,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'Terms & Conditions apply**',
            style: TextStyle(
              color: Color.fromRGBO(142, 137, 137, 1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 8,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<PromoCodeCubit>().usedCode(promoCode: usedCode);
            },
            style: ElevatedButton.styleFrom(
              elevation: 2,
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: widget.size.width * 0.2,
              ),
            ),
            child: const Text(
              'Apply Code',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromRGBO(222, 221, 221, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
