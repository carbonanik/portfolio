import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/input_block_title.dart';
import 'package:portfolio/new_article/contents/content_base.dart';
import 'package:portfolio/new_article/contents/content_title.dart';

class Article implements List<ContentBase> {
  ContentTitle _headline = ContentTitle(text: "");
  List<ContentBase> _contents = [];

  Article();

  Article.initial({
    required ContentTitle headline,
    required List<ContentBase> contents,
  }) {
    _headline = headline;
    _contents = contents;
  }

  // void updateHeadline(String headlineText) {
  //   _headline = ContentTitle(text: headlineText);
  // }

  Widget generateHeadlineView({
    bool readOnly = true,
    final Function(ContentBase)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase)? goUp,
    final void Function(ContentBase)? goDown,
    final void Function(ContentBase, ContentType)? contentItemClick,
  }) {
    return _headline.generateView(
      readOnly: readOnly,
      close: close,
      updated: updated,
      goUp: goUp,
      goDown: goDown,
      contentItemClick: contentItemClick,
    );
  }

  @override
  Iterator<ContentBase> get iterator => _contents.iterator;

  @override
  List<ContentBase> operator +(List<ContentBase> other) {
    return _contents + other;
  }

  @override
  ContentBase operator [](int index) {
    return _contents[index];
  }

  @override
  void operator []=(int index, ContentBase value) {
    _contents[index] = value;
  }

  @override
  void add(ContentBase value) {
    _contents.add(value);
  }

  @override
  void addAll(Iterable<ContentBase> iterable) {
    _contents.addAll(iterable);
  }

  @override
  Map<int, ContentBase> asMap() {
    return _contents.asMap();
  }

  @override
  void clear() {
    _contents.clear();
  }

  @override
  void fillRange(int start, int end, [ContentBase? fillValue]) {
    _contents.fillRange(start, end, fillValue);
  }

  @override
  set first(ContentBase value) {
    _contents.first = value;
  }

  @override
  Iterable<ContentBase> getRange(int start, int end) {
    return _contents.getRange(start, end);
  }

  @override
  int indexOf(ContentBase element, [int start = 0]) {
    return _contents.indexOf(element, start);
  }

  @override
  int indexWhere(bool Function(ContentBase element) test, [int start = 0]) {
    return _contents.indexWhere(test, start);
  }

  @override
  void insert(int index, ContentBase element) {
    _contents.insert(index, element);
  }

  @override
  void insertAll(int index, Iterable<ContentBase> iterable) {
    _contents.insertAll(index, iterable);
  }

  @override
  set last(ContentBase value) {
    _contents.last = value;
  }

  @override
  int lastIndexOf(ContentBase element, [int? start]) {
    return _contents.lastIndexOf(element, start);
  }

  @override
  int lastIndexWhere(bool Function(ContentBase element) test, [int? start]) {
    return _contents.lastIndexWhere(test, start);
  }

  @override
  set length(int newLength) {
    _contents.length = newLength;
  }

  @override
  bool remove(Object? value) {
    return _contents.remove(value);
  }

  @override
  ContentBase removeAt(int index) {
    return _contents.removeAt(index);
  }

  @override
  ContentBase removeLast() {
    return _contents.removeLast();
  }

  @override
  void removeRange(int start, int end) {
    _contents.removeRange(start, end);
  }

  @override
  void removeWhere(bool Function(ContentBase element) test) {
    _contents.removeWhere(test);
  }

  @override
  void replaceRange(int start, int end, Iterable<ContentBase> replacements) {
    _contents.replaceRange(start, end, replacements);
  }

  @override
  void retainWhere(bool Function(ContentBase element) test) {
    _contents.retainWhere(test);
  }

  @override
  Iterable<ContentBase> get reversed => _contents.reversed;

  @override
  void setAll(int index, Iterable<ContentBase> iterable) {
    _contents.setAll(index, iterable);
  }

  @override
  void setRange(int start, int end, Iterable<ContentBase> iterable, [int skipCount = 0]) {
    _contents.setRange(start, end, iterable, skipCount);
  }

  @override
  void shuffle([Random? random]) {
    _contents.shuffle(random);
  }

  @override
  void sort([int Function(ContentBase a, ContentBase b)? compare]) {
    _contents.sort(compare);
  }

  @override
  List<ContentBase> sublist(int start, [int? end]) {
    return _contents.sublist(start, end);
  }

  @override
  bool any(bool Function(ContentBase element) test) {
    return _contents.any((element) => false);
  }

  @override
  List<R> cast<R>() {
    return _contents.cast<R>();
  }

  @override
  bool contains(Object? element) {
    return _contents.contains(element);
  }

  @override
  ContentBase elementAt(int index) {
    return _contents.elementAt(index);
  }

  @override
  bool every(bool Function(ContentBase element) test) {
    return _contents.every((element) => false);
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(ContentBase element) toElements) {
    return _contents.expand(toElements);
  }

  @override
  ContentBase get first => _contents.first;

  @override
  ContentBase firstWhere(bool Function(ContentBase element) test, {ContentBase Function()? orElse}) {
    return _contents.firstWhere(test, orElse: orElse);
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, ContentBase element) combine) {
    return _contents.fold(initialValue, combine);
  }

  @override
  Iterable<ContentBase> followedBy(Iterable<ContentBase> other) {
    return _contents.followedBy(other);
  }

  @override
  void forEach(void Function(ContentBase element) action) {
    _contents.forEach(action);
  }

  @override
  bool get isEmpty => _contents.isEmpty;

  @override
  bool get isNotEmpty => _contents.isNotEmpty;

  @override
  String join([String separator = ""]) {
    return _contents.join(separator);
  }

  @override
  ContentBase get last => _contents.last;

  @override
  ContentBase lastWhere(bool Function(ContentBase element) test, {ContentBase Function()? orElse}) {
    return _contents.lastWhere(test, orElse: orElse);
  }

  @override
  int get length => _contents.length;

  @override
  Iterable<T> map<T>(T Function(ContentBase e) toElement) {
    return _contents.map(toElement);
  }

  @override
  ContentBase reduce(ContentBase Function(ContentBase value, ContentBase element) combine) {
    return _contents.reduce(combine);
  }

  @override
  ContentBase get single => _contents.single;

  @override
  ContentBase singleWhere(bool Function(ContentBase element) test, {ContentBase Function()? orElse}) {
    return _contents.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<ContentBase> skip(int count) {
    return _contents.skip(count);
  }

  @override
  Iterable<ContentBase> skipWhile(bool Function(ContentBase value) test) {
    return _contents.skipWhile(test);
  }

  @override
  Iterable<ContentBase> take(int count) {
    return _contents.take(count);
  }

  @override
  Iterable<ContentBase> takeWhile(bool Function(ContentBase value) test) {
    return _contents.takeWhile(test);
  }

  @override
  List<ContentBase> toList({bool growable = true}) {
    return _contents.toList(growable: growable);
  }

  @override
  Set<ContentBase> toSet() {
    return _contents.toSet();
  }

  @override
  Iterable<ContentBase> where(bool Function(ContentBase element) test) {
    return _contents.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    return _contents.whereType<T>();
  }
}
