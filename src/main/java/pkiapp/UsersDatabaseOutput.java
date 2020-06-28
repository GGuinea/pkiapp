package pkiapp;

public class UsersDatabaseOutput {
    private int id;
    private String name;
    private String createTime;
    private String lastVisitedTime;
    private int counter;

    public UsersDatabaseOutput(int id, String name, String createTime, String lastVisitedTime, int counter) {
        this.id = id;
        this.name = name;
        this.createTime = createTime;
        this.lastVisitedTime = lastVisitedTime;
        this.counter = counter;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCreateTime() {
        return createTime;
    }

    public String getLastVisitedTime() {
        return lastVisitedTime;
    }

    public int getCounter() {
        return counter;
    }
}
