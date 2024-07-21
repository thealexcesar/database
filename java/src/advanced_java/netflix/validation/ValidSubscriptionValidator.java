package advanced_java.netflix.validation;

import advanced_java.netflix.domain.SubscriptionPlan;

import java.lang.reflect.Field;

public class ValidSubscriptionValidator {
    public static void validate(Object object) throws IllegalAccessException {
        Field[] fields = object.getClass().getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(ValidSubscription.class)) {
                field.setAccessible(true);
                SubscriptionPlan plan = (SubscriptionPlan) field.get(object);
                if (plan == null || !(plan == SubscriptionPlan.BASIC ||
                        plan == SubscriptionPlan.STANDARD ||
                        plan == SubscriptionPlan.PREMIUM)) {
                    ValidSubscription annotation = field.getAnnotation(ValidSubscription.class);
                    throw new IllegalArgumentException(annotation.message());
                }
            }
        }
    }
}
