package spacewar;

public aspect TwoShipsFired {
	Ship ship = null;
	Ship myship = null;
	after(Ship ship) : this(ship) && initialization(Ship.new(..)){
		if(myship ==null) {
			myship = ship;
			System.out.println("new");
		}
	}
	pointcut firePc(Ship ship) : target(ship) && call(void Ship.fire());
	
	after(Ship currentShip) : firePc(currentShip) {
		
		if(ship!=null && currentShip != ship && ship != myship) {
			System.out.println("Ok");
		}else if(ship==null && ship != myship) {
			ship = currentShip;
		}
	}
}
