package com.ssi.drugstore.service;


import com.ssi.drugstore.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
