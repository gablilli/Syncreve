import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// QR Scanner Screen - 二维码扫描页面
class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final barcode = barcodes.first;
    final String? code = barcode.rawValue;

    if (code != null && code.isNotEmpty) {
      // 扫描成功，返回结果但不提交
      Navigator.of(context).pop(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 相机预览
          MobileScanner(controller: _controller, onDetect: _onDetect),
          // 半透明遮罩层，中间有透明扫描框
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.srcOut),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(decoration: const BoxDecoration(color: Colors.black26)),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.red, // 这个颜色会被 ColorFiltered 处理成透明
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 顶部 AppBar
          SafeArea(
            child: AppBar(
              title: const Text('Scan QR Code'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.white,
            ),
          ),
          // 底部提示文字
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  'Align QR code within frame to scan',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
