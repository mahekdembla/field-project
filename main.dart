import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Screens
import 'screens/welcome_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/resend_email_screen.dart';
import 'screens/location_screen.dart';
import 'screens/phone_login_screen.dart';
import 'screens/meal_categories_screen.dart';
import 'screens/kitchens_screen.dart';
import 'screens/chef_login.dart';
import 'screens/role_selection_screen.dart';
import 'screens/chef_dashboard_screen.dart';
import 'screens/chef_chat_screen.dart';
import 'screens/chef_meals_screen.dart';
import 'screens/chef_orders_screen.dart';
import 'screens/add_new_item_screen.dart';
import 'screens/chef_profile_screen.dart';
import 'screens/ChefSettingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDSwj7Wn6mIjYADnWpfxKmq_72Uv5r4two",
        authDomain: "clouddine-8ddaf.firebaseapp.com",
        projectId: "clouddine-8ddaf",
        storageBucket: "clouddine-8ddaf.appspot.com",
        messagingSenderId: "756908774696",
        appId: "1:756908774696:web:acdb36284cf92e5c166c1d",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const CloudDineApp());
}

class CloudDineApp extends StatelessWidget {
  const CloudDineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud Dine',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1C1C1C),
        primaryColor: const Color(0xFFC8A2C8),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFC8A2C8)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/resend-email': (context) => const ResendEmailScreen(),
        '/location': (context) => const LocationScreen(),
        '/phone-login': (context) => PhoneLoginScreen(),
        '/kitchens': (context) => const KitchensScreen(),
        '/meal-categories': (context) {
          final kitchenName = ModalRoute.of(context)!.settings.arguments as String;
          return MealCategoriesScreen(kitchenName: kitchenName);
        },
        '/chef-login': (context) => const ChefLoginScreen(),
        '/role-selection': (context) => const RoleSelectionScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/chef-dashboard': (context) => const ChefDashboardScreen(),
        '/chat': (context) => const ChefChatScreen(), // ✅ Chat screen is registered here
        '/chef-orders': (context) => const ChefOrderScreen(),
        '/add-new-item': (context) => const AddNewItemScreen(),
        '/chef-profile': (context) => const ChefProfileScreen(),// Add this line for ChefOrderScreen
      },
    );
  }
}
