package com.sept.telemedicine.repository;

import com.sept.telemedicine.model.Booking;
// import com.sept.telemedicine.model.Patient;
// import com.sept.telemedicine.model.PatientHealthInformation;
import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
// import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Optional;

@Repository
public interface BookingRepo extends JpaRepository<Booking, Integer> {

    @Query("SELECT * FROM Booking WHERE username = ?1")
    ArrayList<Booking> getPatientBookingDetails(@Param("username") String username);

}
