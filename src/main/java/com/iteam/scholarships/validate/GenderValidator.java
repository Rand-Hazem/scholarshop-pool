package com.iteam.scholarships.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class GenderValidator implements ConstraintValidator<Gender, Character> {
    @Override
    public void initialize(Gender constraintAnnotation) {
    }

    @Override
    public boolean isValid(Character value, ConstraintValidatorContext context) {
        if(value != null && ("M".equalsIgnoreCase(value.toString()) || "F".equalsIgnoreCase(value.toString()))){
            return true;
        }
        return false;
    }
}
