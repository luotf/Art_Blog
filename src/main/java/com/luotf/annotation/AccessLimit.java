package com.luotf.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import static java.lang.annotation.ElementType.METHOD; 
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Retention(RUNTIME) 
@Target(METHOD)
public @interface AccessLimit {
	
	int seconds() default 5; 
	int maxCount() default 2; 
}
