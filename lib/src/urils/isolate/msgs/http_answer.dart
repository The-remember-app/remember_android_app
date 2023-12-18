class CrossIsolateHttpAnswer<TData> {
  final int statusCode;
  final TData data;

  CrossIsolateHttpAnswer(this.statusCode, this.data);
}
