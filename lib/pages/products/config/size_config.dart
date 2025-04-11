import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late bool isMobile;
  static late bool isTablet;
  static late bool isDesktop;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

   /* // Détection du type d'appareil selon la largeur de l'écran
    isMobile = screenWidth < 600;
    isTablet = screenWidth >= 600 && screenWidth < 1024;
    isDesktop = screenWidth >= 1024;*/
  }

  static double getScreenWidth() => screenWidth;
  static double getScreenHeight() => screenHeight;



  /*/// Retourne une taille proportionnelle en largeur
  static double getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / 375.0) * screenWidth;
  }
  /// Retourne une taille proportionnelle en hauteur
  static double getProportionateScreenHeight(double inputHeight) {
    return (inputHeight / 812.0) * screenHeight;
  }*/





  /*/// Exemple : adapter un widget à la largeur de l'écran
  static double getProportionateWidth(double inputWidth) {
    // 1440 = largeur standard desktop de référence
    return (inputWidth / 1440.0) * screenWidth;
  }

  /// Exemple : adapter un widget à la hauteur de l'écran
  static double getProportionateHeight(double inputHeight) {
    // 1024 = hauteur standard desktop de référence
    return (inputHeight / 1024.0) * screenHeight;
  }*/
}
