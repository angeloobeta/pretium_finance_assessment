import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';

class EnterWalletAddressScreen extends StatefulWidget {
  const EnterWalletAddressScreen({super.key});

  @override
  _EnterWalletAddressScreenState createState() =>
      _EnterWalletAddressScreenState();
}

class _EnterWalletAddressScreenState extends State<EnterWalletAddressScreen> {
  final TextEditingController _addressController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _searchAddress() {
    // In a real app, you would make an API call to search for the wallet address
    // For this mockup, we'll just simulate a search
    if (_addressController.text.isNotEmpty) {
      setState(() {
        _searchResults = [
          {
            'name': 'Wallet 1',
            'address': _addressController.text,
            'network': 'Celo Network',
          }
        ];
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Enter Wallet Address',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => navigationService.goBack(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wallet Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            // Address Input
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        hintText: 'Paste wallet address',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onChanged: (value) => _searchAddress(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner,
                        color: Color(0xFF0F7269)),
                    onPressed: () {
                      // Scan QR code
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.content_paste,
                        color: Color(0xFF0F7269)),
                    onPressed: () async {
                      ClipboardData? data =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      if (data != null && data.text != null) {
                        _addressController.text = data.text!;
                        _searchAddress();
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Results Label
            const Text(
              'Results',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            // Results List
            Expanded(
              child: _searchResults.isEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final result = _searchResults[index];
                        return ListTile(
                          title: Text(result['name']),
                          subtitle: Text(result['address']),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // Navigate to wallet details
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
