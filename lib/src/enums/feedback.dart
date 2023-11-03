enum LoadResult {
  complete(0),
  failed(1),
  noData(2),
  ;

  final int value;

  const LoadResult(this.value);
}
