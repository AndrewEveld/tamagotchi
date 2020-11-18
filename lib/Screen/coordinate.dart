class Coordinate{

  int x;
  int y;

  Coordinate(this.x, this.y);

  int getX(){return x;}

  int getY(){return y;}

  @override
  bool operator ==(Object other) => other is Coordinate && x == other.x && y == other.y;

  @override
  int get hashCode => super.hashCode;


}