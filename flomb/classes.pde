class Plane {
  PVector loc;
  PVector vel;
  PVector rot;
  Plane(PVector loc, PVector vel, PVector rot) {
    this.loc = loc;
    this.vel = vel;
    this.rot = rot;
  }
  void update() {
    vel.y += GRAVITY;
    loc.x = wclip(loc.x);
    loc.y = hclip(loc.y);
    rot = PVector.fromAngle((vel.heading() + rot.heading()) / 2 - vel.mag() * .1);
    loc.add(vel.copy().mult(.3));
    loc.add(rot.copy().mult(vel.mag()*.7));
    vel.mult(.99);
  }
  void ads(DrawMan m) {
    nad(m, 0, loc, rot, -10, -1, 10, -1);
    nad(m, 0, loc, rot, -10, 1, 10, 1);
    nad(m, 0, loc, rot, -12, -5, -7, -5);
    nad(m, 0, loc, rot, -12, 5, -7, 5);
    nad(m, 0, loc, rot, 3, -5, 8, -5);
    nad(m, 0, loc, rot, 3, 5, 8, 5);
  }
}

class Bomb {
  int ct;
  PVector loc;
  PVector vel;
  PVector rot;
  Bomb(PVector loc, PVector vel) {
    ct = millis();
    this.loc = loc;
    this.vel = vel;
  }
  boolean update() { //updates position and velocity, returns whether timer out
    loc.add(vel);
    vel.y += GRAVITY;
    loc.x = wclip(loc.x);
    loc.y = hclip(loc.y);
    rot = PVector.fromAngle(vel.heading());
    return millis() - ct > BOMB_TIME;
  }
  void ads(DrawMan m) {
    //m.strokes.add(new Stroke(0, P(loc).add(P(-10, -10)), P(loc).add(P(10, 10))));
    //m.strokes.add(new Stroke(0, P(loc).add(P(10, -10)), P(loc).add(P(-10, 10))));
    nad(m, 0, loc, rot, P(-10, -10), P(-10, 10));
    nad(m, 0, loc, rot, P(-10, 10), P(10, 10));
    nad(m, 0, loc, rot, P(10, 10), P(10, -10));
    nad(m, 0, loc, rot, P(10, -10), P(-10, -10));
  }
}
float wclip(float x) {
  return (((x % width) + width) % width);
}
float hclip(float y) {
  return (((y % height) + height) % height);
}
