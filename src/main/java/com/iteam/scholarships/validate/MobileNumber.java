package com.iteam.scholarships.validate;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = MobileNumberValidator.class)
@Documented
public @interface MobileNumber {
    String message() default "invalid mobile number";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    @Target({ElementType.METHOD, ElementType.FIELD})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    @interface List{
        MobileNumber[]value();
    }
}

