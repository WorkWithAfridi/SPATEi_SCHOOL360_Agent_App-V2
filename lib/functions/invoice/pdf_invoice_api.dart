import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/invoice.dart';
import 'file_handle_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfInvoiceApi {
  static Future<File> generate(BuildContext context) async {
    InvoiceProvider invoiceProvider =
        Provider.of<InvoiceProvider>(context, listen: false);
    final pdf = pw.Document();

    final iconImage =
        (await rootBundle.load('lib/assets/logo.png')).buffer.asUint8List();

    final tableHeaders = [
      'Description',
      'Amount',
      'Waiver Amount',
      'Discount Amount',
      'Paid',
    ];

    List<List<String>> tableData = [];

    for (int i = 0;
        i < invoiceProvider.dataModelForInvoice.collectionDetails!.length;
        i++) {
      tableData.add([
        invoiceProvider.dataModelForInvoice.collectionDetails![i].subCategory
            .toString(),
        invoiceProvider.dataModelForInvoice.collectionDetails![i].actualAmount
            .toString(),
        invoiceProvider.dataModelForInvoice.collectionDetails![i].waiverAmount
            .toString(),
        invoiceProvider.dataModelForInvoice.collectionDetails![i].discountAmount
            .toString(),
        invoiceProvider.dataModelForInvoice.collectionDetails![i].paidAmount
            .toString(),
      ]);
    }

    // final tableData = [
    //   [
    //     'Coffee',
    //     '7',
    //     '\$ 5',
    //     '1 %',
    //     '\$ 35',
    //   ],
    //   [
    //     'Blue Berries',
    //     '5',
    //     '\$ 10',
    //     '2 %',
    //     '\$ 50',
    //   ],
    //   [
    //     'Water',
    //     '1',
    //     '\$ 3',
    //     '1.5 %',
    //     '\$ 3',
    //   ],
    //   [
    //     'Apple',
    //     '6',
    //     '\$ 8',
    //     '2 %',
    //     '\$ 48',
    //   ],
    //   [
    //     'Lunch',
    //     '3',
    //     '\$ 90',
    //     '12 %',
    //     '\$ 270',
    //   ],
    //   [
    //     'Drinks',
    //     '2',
    //     '\$ 15',
    //     '0.5 %',
    //     '\$ 30',
    //   ],
    //   [
    //     'Lemon',
    //     '4',
    //     '\$ 7',
    //     '0.5 %',
    //     '\$ 28',
    //   ],
    // ];

    pdf.addPage(
      pw.MultiPage(
        // header: (context) {
        //   return pw.Text(
        //     'Flutter Approach',
        //     style: pw.TextStyle(
        //       fontWeight: pw.FontWeight.bold,
        //       fontSize: 15.0,
        //     ),
        //   );
        // },
        build: (context) {
          return [
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Image(
                    pw.MemoryImage(iconImage),
                    height: 72,
                    width: 72,
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Column(
                        children: [
                          pw.Text(
                            invoiceProvider
                                .dataModelForInvoice.instituteInfo!.schoolName
                                .toString(),
                            style: pw.TextStyle(
                              fontSize: 17.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 1 * PdfPageFormat.mm),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                'Address: ',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                invoiceProvider
                                    .dataModelForInvoice.instituteInfo!.address
                                    .toString(),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 1 * PdfPageFormat.mm),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                'Email: ',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                invoiceProvider
                                    .dataModelForInvoice.instituteInfo!.email
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 72,
                    width: 72,
                    // child: pw.Image(
                    //   pw.MemoryImage(iconImage),
                    //   height: 72,
                    //   width: 72,
                    // ),
                  )
                ]),
            pw.SizedBox(height: 20),
            pw.Row(
              children: [
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Money Receipt',
                      style: pw.TextStyle(
                        fontSize: 17.0,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "Transaction ID: ${invoiceProvider.dataModelForInvoice.collectionInfo![0].transactionId.toString()}",
                      style: const pw.TextStyle(
                        fontSize: 10.0,
                        color: PdfColors.grey700,
                      ),
                    ),
                    pw.Text(
                      "Receipt No: ${invoiceProvider.dataModelForInvoice.collectionInfo![0].receiptNo.toString()}",
                      style: const pw.TextStyle(
                        fontSize: 10.0,
                        color: PdfColors.grey700,
                      ),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      invoiceProvider
                          .dataModelForInvoice.collectionInfo![0].studentName
                          .toString(),
                      style: pw.TextStyle(
                        fontSize: 15.5,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "ID: ${invoiceProvider.dataModelForInvoice.collectionInfo![0].studentCode.toString()}",
                    ),
                  ],
                ),
              ],
            ),

            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Date: ${invoiceProvider.dataModelForInvoice.collectionInfo![0].entryDate.toString().substring(0, invoiceProvider.dataModelForInvoice.collectionInfo![0].entryDate!.length - 8)}",
                  style: pw.TextStyle(
                    fontSize: 10.5,
                    // fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  "Time: ${invoiceProvider.dataModelForInvoice.collectionInfo![0].entryDate.toString().substring(invoiceProvider.dataModelForInvoice.collectionInfo![0].entryDate!.length - 8, invoiceProvider.dataModelForInvoice.collectionInfo![0].entryDate!.length)}",
                  style: pw.TextStyle(
                    fontSize: 10.5,
                    // fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
            pw.Divider(),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            // pw.Text(
            //   'Dear John,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
            //   textAlign: pw.TextAlign.justify,
            // ),
            // pw.SizedBox(height: 5 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: tableData,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                children: [
                  // pw.Spacer(flex: 2),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Net Amount:',
                                style: pw.TextStyle(
                                    // fontWeight: pw.FontWeight.bold,
                                    ),
                              ),
                            ),
                            pw.Text(
                              '${invoiceProvider.dataModelForInvoice.collectionInfo![0].totalPaidAmount.toString()} Tk',
                              style: pw.TextStyle(
                                  // fontWeight: pw.FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Vat 19.5 %',
                        //         style: pw.TextStyle(
                        //           fontWeight: pw.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       '\$ 90.48',
                        //       style: pw.TextStyle(
                        //         fontWeight: pw.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        pw.Divider(),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Amount paid:',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  // fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              '${invoiceProvider.dataModelForInvoice.collectionInfo![0].totalPaidAmount.toString()} Tk',
                              style: pw.TextStyle(
                                  // fontWeight: pw.FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Amount paid in word:',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  // fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              invoiceProvider
                                  .dataModelForInvoice.totalAmountInWords
                                  .toString(),
                              style: pw.TextStyle(
                                  // fontWeight: pw.FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        pw.Divider(),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Payment Type:',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  // fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              invoiceProvider.dataModelForInvoice
                                  .collectionInfo![0].paymentType
                                  .toString(),
                              style: pw.TextStyle(
                                  // fontWeight: pw.FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Remarks:',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  // fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              invoiceProvider.dataModelForInvoice
                                  .collectionInfo![0].remarks
                                  .toString(),
                              style: pw.TextStyle(
                                  // fontWeight: pw.FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 2 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                        pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        footer: (context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Divider(),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              pw.Text(
                'S C H O O L 3 6 0',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              // pw.Text(
              //   'App By: Khondakar Morshed Afridi',
              //   style: pw.TextStyle(
              //       fontWeight: pw.FontWeight.bold,
              //       color: PdfColor.fromHex('#fafafa')),
              // ),
            ],
          );
        },
      ),
    );

    return FileHandleApi.saveDocument(name: 'InvoiceNo.pdf', pdf: pdf);
  }
}
