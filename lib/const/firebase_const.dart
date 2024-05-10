import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

// collections
const vendorCollection = "vendors";
const productsCollection = "products";
const chatCollection = 'chats';
const messageCollection = 'messages';
const ordersCollection = 'orders';
