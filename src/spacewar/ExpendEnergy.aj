package spacewar;

public aspect ExpendEnergy {
	pointcut notifyLosingEnergy(Ship ship):
		target(ship) && call(boolean Ship.expendEnergy(double));
	after(Ship ship) returning: notifyLosingEnergy(ship){
		if(ship.getPilot().getNumber()==1 || ship.getPilot().getNumber()==2) {
			System.out.println("You're spending energy");
		}
	}
}
