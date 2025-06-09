package lk.sandun.ee.ejb;

import jakarta.ejb.Stateless;
import lk.sandun.ee.core.model.User;

import java.util.ArrayList;
import java.util.List;

@Stateless
public class UserManager {
    private final List<User> users = new ArrayList<>();

    public void register(User user) {
        users.add(user);
    }

    public User login(String username, String password) {
        return users.stream()
                .filter(u -> u.getUsername().equals(username) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }
}
