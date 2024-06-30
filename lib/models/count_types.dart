import 'package:flutter/material.dart';

enum CountType {
 increment, decrement, reset ;
 /* changer l'icone en fonction du type de comptage */
  Icon getIcon() {
    switch (this) {
      case CountType.increment : return const Icon(Icons.exposure_plus_1);
      case CountType.reset : return const Icon(Icons.exposure_zero);
      case CountType.decrement : return const Icon(Icons.exposure_minus_1);
    }
  }
}