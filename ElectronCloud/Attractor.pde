public class Attractor{
  
  PVector location;
  float mass;
  
  public Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
  }
  
  public void display() {
    stroke(0);
    fill(175, 200);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
  
  public PVector attract(Mover m) {
    float G = 20;
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25); 
    float strength = (G*mass*m.mass) / (distance*distance);
    force.mult(strength);
    
    return force;
  }

}
