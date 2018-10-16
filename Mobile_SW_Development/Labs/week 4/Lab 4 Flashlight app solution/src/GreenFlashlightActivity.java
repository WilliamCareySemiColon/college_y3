/*

  Author: Susan McKeever
  Date: Oct 2017
  Purpose: to open the green screen and return to red when clicked.

*/

// package.. will be whatever package (i.e. folder) name you choose

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class GreenFlashlightActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.green);
		
		Button redButton = (Button)findViewById(R.id.red_button);
		redButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				finish();
			}
		});
	}

}
