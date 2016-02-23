package com.epam.dao.api;

import com.epam.entity.User;

/**
 * Created by infinity on 19.02.16.
 */
public interface UserDao {

    void create(User user);
    void update(User user);
    void delete(int id);
    User findById(int id);
    User findByFirstNameAndLastName(String firstName, String lastName);
    User findByEmail(String email);
}
