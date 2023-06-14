import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_summary_model.dart';
export 'order_summary_model.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({Key? key}) : super(key: key);

  @override
  _OrderSummaryWidgetState createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  late OrderSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderSummaryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.additionalFees = await actions.loadAdditionalFees();
      _model.discounts = await actions.loadDiscounts();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Rangkuman Order',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lokasi Pengerjaan',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Lokasi Pengerjaan',
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Layanan',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Builder(
                            builder: (context) {
                              final services =
                                  FFAppState().selectedServices.toList();
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(services.length,
                                    (servicesIndex) {
                                  final servicesItem = services[servicesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              servicesItem.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          formatNumber(
                                            servicesItem.fee,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                            currency: 'Rp',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16.0,
                        color: Color(0x19000000),
                        offset: Offset(0.0, 2.0),
                        spreadRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Summary',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Service Fee',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    Text(
                                      FFAppState().selectedServices.length > 0
                                          ? formatNumber(
                                              functions.countServiceFee(
                                                  FFAppState()
                                                      .selectedServices
                                                      .toList()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp',
                                            )
                                          : '(No service selected)',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              FutureBuilder<List<AdditionalFeesRow>>(
                                future: AdditionalFeesTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'is_active',
                                        true,
                                      )
                                      .order('fee'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AdditionalFeesRow>
                                      columnAdditionalFeesRowList =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnAdditionalFeesRowList.length,
                                        (columnIndex) {
                                      final columnAdditionalFeesRow =
                                          columnAdditionalFeesRowList[
                                              columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              columnAdditionalFeesRow.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            Text(
                                              columnAdditionalFeesRow.fee == 0.0
                                                  ? 'Gratis'
                                                  : formatNumber(
                                                      columnAdditionalFeesRow
                                                          .fee,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: 'Rp',
                                                    ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                              FutureBuilder<List<DiscountsRow>>(
                                future: DiscountsTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'is_active',
                                        true,
                                      )
                                      .order('discount'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  List<DiscountsRow> columnDiscountsRowList =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnDiscountsRowList.length,
                                        (columnIndex) {
                                      final columnDiscountsRow =
                                          columnDiscountsRowList[columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              columnDiscountsRow.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            Text(
                                              '(${formatNumber(
                                                columnDiscountsRow.discount,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.commaDecimal,
                                                currency: 'Rp',
                                              )})',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 24.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              Text(
                                FFAppState().selectedServices.length > 0
                                    ? formatNumber(
                                        functions.countTotalFee(
                                            FFAppState()
                                                .selectedServices
                                                .toList(),
                                            _model.additionalFees!.toList(),
                                            _model.discounts!.toList()),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'Rp',
                                      )
                                    : 'Rp0',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 48.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.order = await OrdersTable().insert({
                      'order_no':
                          'ORD-MOD-${getCurrentTimestamp.microsecondsSinceEpoch.toString()}',
                      'shceduled_at':
                          supaSerialize<DateTime>(getCurrentTimestamp),
                      'status': 'New',
                      'is_paid': false,
                      'total': FFAppState().activeOrder.total,
                      'customer_id': FFAppState().profile.id,
                    });
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Test'),
                          content: Text(_model.order!.id.toString()),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );

                    context.pushNamed('OrderSummary');

                    setState(() {});
                  },
                  text: 'Order',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
