package spacewar;

public aspect BulletNear {
    Ship playerShip = null;
    
    
    pointcut getPlayer(Pilot pilot):call(Ship Game.newShip(Pilot)) && args(pilot);
    pointcut bulletProximity(Bullet bullet):target(bullet) && call(void clockTick());
    
    after(Pilot pilot) returning(Ship ship):getPlayer(pilot){
        if(playerShip != null) return;
        
        if(pilot.getNumber() == 1 || pilot.getNumber() == 2)
        {
            playerShip = ship;
            System.out.println("player acquired");
        }
    }
    
    after(Bullet bullet) returning : bulletProximity(bullet){
        double x = bullet.getXPos();
        double y = bullet.getYPos();
        double sx = playerShip.getXPos();
        double sy = playerShip.getYPos();
        double distX = x - sx;
        distX *= distX;
        double distY = y - sy;
        distY *= distY;
        if(Math.sqrt(distX + distY) < 10)
        {
            System.out.println("close");
        }
    }
}
