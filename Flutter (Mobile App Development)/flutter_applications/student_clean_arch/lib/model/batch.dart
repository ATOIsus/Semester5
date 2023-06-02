class Batch {
  String? batchId;
  String? batchName;
  
  Batch({
    required this.batchId,
    required this.batchName,
  });
  
  @override
  String toString() {
    return '$batchId, $batchName';
  }
}
