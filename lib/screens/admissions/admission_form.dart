import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/admissions/adm_widgets/adm_web_card.dart';
import 'package:school_management_frontend/screens/admissions/adm_widgets/button_widgets.dart';
import 'package:school_management_frontend/screens/admissions/adm_widgets/payment_widgets.dart';
import 'package:school_management_frontend/screens/admissions/adm_widgets/text_widgets.dart';
import 'package:school_management_frontend/screens/admissions/adm_widgets/widgets.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/widgets/navigation.dart';


class AdmissionForm extends StatefulWidget {
  const AdmissionForm({super.key});

  @override
  State<AdmissionForm> createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  // Form controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _parentFirstNameController = TextEditingController();
  final TextEditingController _parentLastNameController = TextEditingController();
  final TextEditingController _parentEmailController = TextEditingController();
  final TextEditingController _parentPhoneController = TextEditingController();
  final TextEditingController _parentAddressController = TextEditingController();
  
  String _paymentMethod = 'Cash';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 255, 247),
      appBar: AppBar(
         leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavbar(
                  currentIndex: 2,
                  onIndexChanged: (index) {},
                ),
              ),
            );
          },
        ),
        title: const Text(
          'Add New Student',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: isMobile ? _buildMobileView() : _buildWebView(),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileView() {
    return Column(
      children: [
        // Progress indicator
        AdmissionProgressIndicator(currentPage: _currentPage),
        const SizedBox(height: 24),
        
        // Page view for forms
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildStudentDetailsMobile(),
              _buildParentDetailsMobile(),
              _buildPaymentAndSubmitMobile(),
            ],
          ),
        ),
        
        // Navigation buttons
        AdmissionMobileNavigationButtons(
          currentPage: _currentPage,
          pageController: _pageController,
          onSubmit: _submitForm,
        ),
      ],
    );
  }

  Widget _buildWebView() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Student Details Card
              AdmissionWebCard(
                title: 'Student Details',
                child: _buildStudentDetailsWeb(),
              ),
              
              const SizedBox(height: 24),
              
              // Parent Details Card
              AdmissionWebCard(
                title: 'Parent Details',
                child: _buildParentDetailsWeb(),
              ),
              
              const SizedBox(height: 24),
              
              // Payment Card
              AdmissionWebCard(
                title: 'Payments',
                child: AdmissionPaymentSection(
                  selectedValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value;
                    });
                  },
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Submit Button
              AdmissionSubmitButton(onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentDetailsMobile() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.green.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdmissionSectionTitle(title: 'Student Details'),
            const SizedBox(height: 20),
            
            // Photo Section
            const AdmissionPhotoSection(),
            const SizedBox(height: 24),
            
            // Form Fields
            AdmissionTextField(
              label: 'First Name *',
              controller: _firstNameController,
              hintText: 'Enter first name',
            ),
            AdmissionTextField(
              label: 'Last Name *',
              controller: _lastNameController,
              hintText: 'Enter last name',
            ),
            AdmissionTextField(
              label: 'Email *',
              controller: _emailController,
              hintText: 'Enter email',
            ),
            AdmissionTextField(
              label: 'Date & Place of Birth *',
              controller: _dobController,
              hintText: '24 February 2003',
            ),
            AdmissionTextField(
              label: 'Address',
              controller: _addressController,
              maxLines: 3,
              hintText: 'Enter address',
            ),
            AdmissionTextField(
              label: 'Phone *',
              controller: _phoneController,
              hintText: '+91 9034567890',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentDetailsWeb() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Photo Section
        const AdmissionPhotoSection(),
        const SizedBox(width: 32),
        
        // Form Fields - Two Columns
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AdmissionTextField(
                      label: 'First Name *',
                      controller: _firstNameController,
                      hintText: 'Enter first name',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AdmissionTextField(
                      label: 'Last Name *',
                      controller: _lastNameController,
                      hintText: 'Enter last name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AdmissionTextField(
                label: 'Email *',
                controller: _emailController,
                hintText: 'Enter email',
              ),
              const SizedBox(height: 16),
              AdmissionTextField(
                label: 'Date & Place of Birth *',
                controller: _dobController,
                hintText: '24 February 2003',
              ),
              const SizedBox(height: 16),
              AdmissionTextField(
                label: 'Address',
                controller: _addressController,
                maxLines: 3,
                hintText: 'Enter address',
              ),
              const SizedBox(height: 16),
              AdmissionTextField(
                label: 'Phone *',
                controller: _phoneController,
                hintText: '+91 9034567890',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildParentDetailsMobile() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.green.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdmissionSectionTitle(title: 'Parent Details'),
            const SizedBox(height: 20),
            
            AdmissionTextField(
              label: 'Parent First Name *',
              controller: _parentFirstNameController,
              hintText: 'Enter first name',
            ),
            AdmissionTextField(
              label: 'Parent Last Name *',
              controller: _parentLastNameController,
              hintText: 'Enter last name',
            ),
            AdmissionTextField(
              label: 'Parent Email *',
              controller: _parentEmailController,
              hintText: 'Enter email',
            ),
            AdmissionTextField(
              label: 'Parent Phone *',
              controller: _parentPhoneController,
              hintText: '+91 9034567890',
            ),
            AdmissionTextField(
              label: 'Parent Address',
              controller: _parentAddressController,
              maxLines: 3,
              hintText: 'Enter address',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParentDetailsWeb() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AdmissionTextField(
                label: 'Parent First Name *',
                controller: _parentFirstNameController,
                hintText: 'Enter first name',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AdmissionTextField(
                label: 'Parent Last Name *',
                controller: _parentLastNameController,
                hintText: 'Enter last name',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AdmissionTextField(
          label: 'Parent Email *',
          controller: _parentEmailController,
          hintText: 'Enter email',
        ),
        const SizedBox(height: 16),
        AdmissionTextField(
          label: 'Parent Phone *',
          controller: _parentPhoneController,
          hintText: '+91 9034567890',
        ),
        const SizedBox(height: 16),
        AdmissionTextField(
          label: 'Parent Address',
          controller: _parentAddressController,
          maxLines: 3,
          hintText: 'Enter address',
        ),
      ],
    );
  }

  Widget _buildPaymentAndSubmitMobile() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.green.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdmissionSectionTitle(title: 'Payments'),
            const SizedBox(height: 20),
            AdmissionPaymentSection(
              selectedValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    AppColors.lightGreen.withOpacity(0.3),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.green,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Success',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Student admission form submitted successfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _parentFirstNameController.dispose();
    _parentLastNameController.dispose();
    _parentEmailController.dispose();
    _parentPhoneController.dispose();
    _parentAddressController.dispose();
    super.dispose();
  }
}