ArrayList<Molecule> molecules = new ArrayList<Molecule>(500);

void setup() {
  background(255);
  size(800, 800);
  for (int i = 0; i < 500; i++) {
    molecules.add(new Molecule(new PVector(random(width/2), random(height)), color(0, 0, 255)));
  }
  for (int i = 0; i < 100; i++) {
    molecules.add(new Molecule(new PVector(random(width/2, width), random(height)), color(255, 0, 0)));
  }
}
void draw() {
  rectMode(CENTER);
  fill(255, 100);
  rect(width/2, height/2, width, height);
  for (int i = 0; i < molecules.size(); i++) {
    Molecule m = molecules.get(i);
    m.display();
    m.move();
    // checking collisions 
    for (int j = i+1; j < molecules.size()-1; j++) {
      Molecule m2 = molecules.get(j);
      PVector to_m2 = PVector.sub(m2.pos, m.pos);
      if (to_m2.mag() < 4) {
        m.vel.mult(-1);
        m2.vel.mult(-1);
      }
    }
  }

}

class Molecule{
  PVector pos, vel;
  color c;
  Molecule(PVector _pos, color _c){
    pos = _pos;
    vel = PVector.random2D().mult(2);
    c = _c;
  }
  void move(){
    pos.add(vel);  
    if (pos.x > width || pos.x < 0){
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0){
      vel.y *= -1;
    }
  }
  void display(){
    stroke(0);
    fill(c);
    circle(pos.x, pos.y, 4);  
  }
}
