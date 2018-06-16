class Team {
  String _icon;

  Team(this._icon);

  String get getIcon => this._icon;

  bool operator ==(o) => (o is Team && o._icon == _icon);
  int get hashCode => 17 + _icon.hashCode;
}