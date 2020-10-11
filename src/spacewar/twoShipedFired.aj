package spacewar;

public aspect twoShipedFired {
	
		public void calculateTrajectory(Bullet bullet) {
			
		}
		pointcut nortifyTrajectory(Ship ship, Bullet bullet):
			target(ship) && this(bullet);
		
}
