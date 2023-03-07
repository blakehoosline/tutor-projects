public class Truck extends Vehicle {
    // instance variables
    public int seats;
    protected double trunkSpace;

    // constructors
    public Truck() {
    }

    public Truck(String color) {
        super(color);
    }

    public Truck(String color, int numDoors) {
        super(color, numDoors);
    }

    public Truck(String color, int numDoors, boolean gasPowered) {
        super(color, numDoors, gasPowered);
    }

    public Truck(String color, int numDoors, boolean gasPowered, int seats) {
        super(color, numDoors, gasPowered);
        this.seats = seats;
    }

    public Truck(String color, int numDoors, boolean gasPowered, double trunkSpace) {
        super(color, numDoors, gasPowered);
        this.trunkSpace = trunkSpace;
    }

    public Truck(String color, int numDoors, boolean gasPowered, int seats, double trunkSpace) {
        super(color, numDoors, gasPowered);
        this.seats = seats;
        this.trunkSpace = trunkSpace;
    }

    public Truck(Vehicle vehicle, int seats) {
        super(vehicle.getColor(), vehicle.getNumDoors(), vehicle.isGasPowered());
        this.seats = seats;
    }

    public Truck(Vehicle vehicle, double trunkSpace) {
        super(vehicle.getColor(), vehicle.getNumDoors(), vehicle.isGasPowered());
        this.trunkSpace = trunkSpace;
    }

    // getters and setters
    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public double getTrunkSpace() {
        return trunkSpace;
    }

    public void setTrunkSpace(double trunkSpace) {
        this.trunkSpace = trunkSpace;
    }

    // toString method
    @Override
    public String toString() {
        return "Truck{" +
                "color='" + color + '\'' +
                ", numDoors=" + numDoors +
                ", gasPowered=" + gasPowered +
                ", seats=" + seats +
                ", trunkSpace=" + trunkSpace +
                '}';
    }

    // isEcoFriendly method
    @Override
    public boolean isEcoFriendly() {
        return super.isEcoFriendly() && (seats <= 2 && trunkSpace == 0);
    }
}
