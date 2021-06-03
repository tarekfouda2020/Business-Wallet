part of 'CompanyPaymentImports.dart';

class CompanyPayment extends StatefulWidget {
  final String userId;
  final int id;

  CompanyPayment({required this.userId, required this.id});

  @override
  _CompanyPaymentState createState() => _CompanyPaymentState();
}

class _CompanyPaymentState extends State<CompanyPayment> {
  final CompanyPaymentData companyPaymentData = new CompanyPaymentData();
  InAppWebViewController? webViewController;
  late String paymentLink = "";
  double progress = 0;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    setState(() {
      initWebView();

      paymentLink = widget.id == 0
          ? "https://bwallet.com.sa/Payment/PayRequestApi?user_id=${widget.userId}"
          : "https://bwallet.com.sa/MadaPayRequestApi?user_id=${widget.userId}";
      print(paymentLink);
    });
    super.initState();
  }

  initWebView() async {
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

      var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
          AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
          AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

      if (swAvailable && swInterceptAvailable) {
        AndroidServiceWorkerController serviceWorkerController =
            AndroidServiceWorkerController.instance();

        serviceWorkerController.serviceWorkerClient =
            AndroidServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            print(request);
            return null;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "الدفع",
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(paymentLink)),
        // initialFile: "assets/index.html",
        initialOptions: options,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          setState(() {
            this.paymentLink = url.toString();
          });
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },

        onLoadStop: (controller, url) async {
          setState(() {
            this.paymentLink = url.toString();
          });
        },

        onProgressChanged:
            (InAppWebViewController controller, int progress) async {
          var _url = await controller.getUrl();

          if (_url!.path.contains("SuccessApi")) {
            Future.delayed(Duration(seconds: 5), () {
              controller.stopLoading();
              AutoRouter.of(context)
                  .push(CompanyRegisterCommercialRoute(userId: widget.userId));
            });
          }
          setState(() {
            this.progress = progress / 100;
          });
        },
      ),
      bottomNavigationBar: IconButton(
        icon: Icon(
          Icons.assignment,
          color: MyColors.primary,
          size: 50,
        ),
        onPressed: () => AutoRouter.of(context).push(
          CompanyRegisterCommercialRoute(userId: widget.userId),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
