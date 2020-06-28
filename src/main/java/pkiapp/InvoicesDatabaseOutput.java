package pkiapp;

public class InvoicesDatabaseOutput {
    private int id;
    private String title;
    private int authorId;
    private String created;

    public InvoicesDatabaseOutput(int id, String title, int authorId, String created) {
        this.id = id;
        this.title = title;
        this.authorId = authorId;
        this.created = created;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public int getAuthorId() {
        return authorId;
    }

    public String getCreated() {
        return created;
    }
}
