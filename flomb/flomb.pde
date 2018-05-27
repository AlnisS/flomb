DrawMan mg;
Bomb b;
Plane p;
void setup() {
  mg = new DrawMan();
  b = new Bomb(P(40, 40), P(2, -1.5));
  p = new Plane(P(100, 100), P(3, -2), PVector.fromAngle(0));
  size(400, 400);
}
void draw() {
  b.update();
  b.ads(mg);
  p.update();
  p.ads(mg);
  mg.draw();
  mg.flush(); //<>//
}
