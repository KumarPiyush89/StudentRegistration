package edu.qs.StudentRegistration;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("select u from User u WHERE u.email = ?1")
    User findByEmail(String email);
}