package com.example.hw5.DAO;


import com.example.hw5.Entity.stuEntity;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface stuDAO extends MongoRepository<stuEntity, String> {


}
