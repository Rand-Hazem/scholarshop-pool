package com.iteam.scholarships.validate;

import org.springframework.beans.BeanWrapperImpl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object> {

    private String firstFieldName;
    private String secoundFieldName;

    @Override
    public void initialize(FieldMatch constraintAnnotation) {
        this.firstFieldName = constraintAnnotation.first();
        this.secoundFieldName = constraintAnnotation.secound();

    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        try{
            BeanWrapperImpl wrapper = new BeanWrapperImpl(value);
            Object firstValue = wrapper.getPropertyValue(firstFieldName);
            Object secoundValue = wrapper.getPropertyValue(secoundFieldName);

            if (firstValue != null && secoundValue != null
                    && firstValue.equals(secoundValue)) {
                return true;
            }
        }catch (Exception e){
            return false;
        }
        return false;
    }
}
