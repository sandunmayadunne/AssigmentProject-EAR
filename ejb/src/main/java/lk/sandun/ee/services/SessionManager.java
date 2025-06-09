package lk.sandun.ee.services;

import jakarta.ejb.Stateful;

@Stateful
public class SessionManager {
    private String username;

    public void setCurrentUser(String username) {
        this.username = username;
    }

    public String getCurrentUser() {
        return username;
    }
}
