class GenresDataModel {
  String labelText;
  bool isSelected;

  GenresDataModel({
    required this.labelText,
    this.isSelected = false,
  });

  GenresDataModel copy({required String labelText, required bool isSelected}) {
    return GenresDataModel(
      labelText: labelText,
      isSelected: isSelected,
    );
  }
}
