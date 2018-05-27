class DrawMan {
  ArrayList<Stroke> strokes;
  DrawMan() {
    strokes = new ArrayList<Stroke>();
  }
  void draw() {
    background(127);
    for(Stroke s : strokes) {
      s.draw();
    }
  }
  void flush() {
    strokes = new ArrayList<Stroke>();
  }
}
class Stroke {
  color c;
  PVector p1;
  PVector p2;
  Stroke(color c, PVector p1, PVector p2) {
    this.c = c;
    this.p1 = p1;
    this.p2 = p2;
  }
  void draw() {
    stroke(c);
    line(p1, p2);
    println(p1.x, p1.y, p2.x, p2.y);
  }
}
void nad(DrawMan m, color c, PVector loc, PVector rot, float x1, float y1, float x2, float y2) {
  nad(m, c, loc, rot, P(x1, y1), P(x2, y2));
}
void nad(DrawMan m, color c, PVector loc, PVector rot, PVector p1, PVector p2) {
  PVector t1 = p1.copy();
  PVector t2 = p2.copy();
  t1.rotate(rot.heading());
  t2.rotate(rot.heading());
  m.strokes.add(new Stroke(c, loc.copy().add(t1), loc.copy().add(t2)));
}
void line(PVector p1, PVector p2) {
  line(p1.x, p1.y, p2.x, p2.y);
}
PVector P(float x, float y) {
  return new PVector(x, y);
}
