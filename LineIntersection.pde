ArrayList<PVector> vertexes = new ArrayList<PVector>();

PVector d = new PVector(50,150);

void setup(){
 size(800,600);
 vertexes.add(new PVector(100,100));
 vertexes.add(new PVector(200,100));
 vertexes.add(new PVector(200,200));
 vertexes.add(new PVector(100,200));
 vertexes.add(new PVector(50,150));
}

float getMult(PVector v1, PVector v0, PVector dest){
  PVector v = v1.copy().add(-v0.x,-v0.y);
  PVector vd = dest.copy().add(-v0.x,-v0.y);
  float res = v.cross(vd).z;
  //println(v);
  //println(vd);
  //println(res);
  return res;
}

boolean IsIntersect(ArrayList<PVector> vs, PVector dest){
  float z = Float.MAX_VALUE;
  for (int i = 1; i < vs.size(); i++){
    float res = getMult(vs.get(i), vs.get(i-1), dest);
    if (z != Float.MAX_VALUE)
      if (Math.signum(res)!=Math.signum(z))
        return false;
    z = res;
  }
  //last one
  float res = getMult(vs.get(0), vs.get(vs.size()-1), dest);
  if (Math.signum(res)!=Math.signum(z))
    return false;
  return true;
}

void draw(){
 background(0,0,0);
 beginShape();
 for(PVector v : vertexes)
   vertex(v.x,v.y);
 endShape();
 d = new PVector(mouseX, mouseY);
 ellipse(d.x, d.y, 20,20);
 println("---");
 text(IsIntersect(vertexes, d) ? "true" : "false",20,20);
 //noLoop();
}