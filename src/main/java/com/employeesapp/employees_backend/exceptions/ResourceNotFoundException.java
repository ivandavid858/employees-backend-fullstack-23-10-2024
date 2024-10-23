package com.employeesapp.employees_backend.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {

    private static final long serialVersionID = 1; // This is the id for this class

    public ResourceNotFoundException(String msg) {
        super(msg);
    }
}
