package com.example.hw4.DAO;


import com.example.hw4.Entity.stuEntity;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface stuDAO extends MongoRepository<stuEntity, String> {


}
