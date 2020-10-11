package spacewar;

public aspect notifyBulletCreated {
    pointcut notifyBulletcreated(): within(Bullet) && execution(new(..));
    
    after():notifyBulletcreated(){
        System.out.println("Bullet fired");
    }
}
