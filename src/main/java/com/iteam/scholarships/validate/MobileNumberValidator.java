package com.iteam.scholarships.validate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.io.IOException;

public class MobileNumberValidator implements ConstraintValidator<MobileNumber, String> {
    @Override
    public void initialize(MobileNumber constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null || value.isEmpty() || value.length() < 7) {
            return false;
        }
        try {
            PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil.getInstance();
            return phoneNumberUtil.isValidNumber(phoneNumberUtil.parse(value, ""));
        } catch (Exception e) {
            return false;
        }
    }
}
