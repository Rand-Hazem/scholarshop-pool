package com.iteam.scholarships.validate;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * Anotation to validate two field have same value
 */
@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = FieldMatchValidator.class)
@Documented
public @interface FieldMatch {

    String message() default "field matching error";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    
    String first();
    String secound();

    @Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    @interface List{
        FieldMatch [] value();
    }
}
