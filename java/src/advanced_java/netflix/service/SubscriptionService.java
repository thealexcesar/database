package advanced_java.netflix.service;

import advanced_java.netflix.domain.SubscriptionPlan;
import advanced_java.netflix.domain.User;

public class SubscriptionService {
    public void changePlan(User user, SubscriptionPlan newPlan) {
        user.setPlan(newPlan);
    }
}
