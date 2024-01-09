/// Abstract base class for parsing a list of [T] elements from the Fomet XML
/// API.
abstract base class FometBaseParser<T> {
  /// The XML-encoded string to be parsed.
  final String xmlContent;

  /// Creates a [FometBaseParser] object.
  const FometBaseParser({required this.xmlContent});

  /// Parses [xmlContent] and returns a list of [T] objects.
  List<T> parse();
}
