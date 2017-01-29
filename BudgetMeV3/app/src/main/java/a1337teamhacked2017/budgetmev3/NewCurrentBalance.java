package a1337teamhacked2017.budgetmev3;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class NewCurrentBalance extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new_current_balance);

        //Do circle stuff
        Circle circle = (Circle) findViewById(R.id.circle);

        CircleAngleAnimation animation = new CircleAngleAnimation(circle, 240);
        animation.setDuration(5000);
        circle.startAnimation(animation);
    }
}
