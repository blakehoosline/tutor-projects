public class Vehicle {
    // instance variables
    protected String color;
    protected int numDoors;
    boolean gasPowered;

    // constructors
    public Vehicle() {
    }

    public Vehicle(String color) {
        this.color = color;
    }

    public Vehicle(String color, int numDoors) {
        this.color = color;
        this.numDoors = numDoors;
    }

    public Vehicle(String color, int numDoors, boolean gasPowered) {
        this.color = color;
        this.numDoors = numDoors;
        this.gasPowered = gasPowered;
    }

    // getters and setters
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getNumDoors() {
        return numDoors;
    }

    public void setNumDoors(int numDoors) {
        this.numDoors = numDoors;
    }

    public boolean isGasPowered() {
        return gasPowered;
    }

    public void setGasPowered(boolean gasPowered) {
        this.gasPowered = gasPowered;
    }

    // toString method
    @Override
    public String toString() {
        return "Vehicle{" +
                "color='" + color + '\'' +
                ", numDoors=" + numDoors +
                ", gasPowered=" + gasPowered +
                '}';
    }

    // isEcoFriendly method
    public boolean isEcoFriendly() {
        return numDoors == 2 && !gasPowered;
    }
}
