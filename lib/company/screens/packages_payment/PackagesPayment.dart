part of "PackagesPaymentImports.dart";

class PackagesPayment extends StatefulWidget {
  final String userId;
  final String cost;
  final int type;
  final String advertId;

  const PackagesPayment(
      {required this.userId,
      required this.cost,
      required this.type,
      required this.advertId});

  @override
  _PackagesPaymentState createState() => _PackagesPaymentState();
}

class _PackagesPaymentState extends State<PackagesPayment> {
  final PackagesPaymentData _paymentData = PackagesPaymentData();

  @override
  void initState() {
    _paymentData.initPayment(
        userId: widget.userId,
        cost: widget.cost,
        type: widget.type,
        advertId: widget.advertId);
    _paymentData.initWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "الدفع",
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(_paymentData.paymentLink)),
        // initialFile: "assets/index.html",
        initialOptions: _paymentData.options,
        onWebViewCreated: (controller) {
          _paymentData.webViewController = controller;
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },

        onProgressChanged:
            (InAppWebViewController controller, int progress) async {
          Uri? _url = await controller.getUrl();

          if (_url!.path.contains("SuccessApi")) {
            Future.delayed(Duration(seconds: 5), () {
              controller.stopLoading();
              AutoRouter.of(context).push(CompanyHomeRoute(index: 2));
            });
          }
        },
      ),
    );
  }
}
