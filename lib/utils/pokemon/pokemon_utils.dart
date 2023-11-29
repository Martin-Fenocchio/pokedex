import 'package:flutter/material.dart';

Color getTagColor(String tag) {
  switch (tag) {
    case 'fire':
      return const Color(0xffF57D31);
    case 'water':
      return const Color(0xff6890F0);
    case 'grass':
      return const Color(0xff78C850);
    case 'bug':
      return const Color(0xffA8B820);
    case 'normal':
      return const Color(0xffA8A878);
    case 'poison':
      return const Color(0xffA040A0);
    case 'electric':
      return const Color(0xffF8D030);
    case 'ground':
      return const Color(0xffE0C068);
    case 'fairy':
      return const Color(0xffEE99AC);
    case 'fighting':
      return const Color(0xffC03028);
    case 'psychic':
      return const Color(0xffF85888);
    case 'rock':
      return const Color(0xffB8A038);
    case 'ghost':
      return const Color(0xff705898);
    case 'ice':
      return const Color(0xff98D8D8);
    case 'dragon':
      return const Color(0xff7038F8);
    case 'dark':
      return const Color(0xff705848);
    case 'steel':
      return const Color(0xffB8B8D0);
    case 'flying':
      return const Color(0xffA890F0);
    default:
      return const Color(0xffF57D31);
  }
}

String getStatAbbr(String stat) {
  switch (stat) {
    case 'hp':
      return 'HP';
    case 'attack':
      return 'ATK';
    case 'defense':
      return 'DEF';
    case 'special-attack':
      return 'SATK';
    case 'special-defense':
      return 'SDEF';
    case 'speed':
      return 'SPD';
    default:
      return 'HP';
  }
}
