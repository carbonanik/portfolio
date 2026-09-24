import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/data.dart';

void main() {
  test('portfolio keeps a curated project set with detail content', () {
    expect(kProjects.length, inInclusiveRange(3, 5));
    expect(kProjects.first.problem, isNotEmpty);
    expect(kProjects.first.contributions, isNotEmpty);
    expect(kProjects.first.architectureNote, isNotEmpty);
  });
}
