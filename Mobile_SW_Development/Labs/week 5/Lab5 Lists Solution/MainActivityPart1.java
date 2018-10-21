package com.example.susanmckeever.lists;
/*
   author: Susan McKeever
   Date:   Oct 2017
   purpose: displays a one column list.  Uses a predefined row template (Android.r.simple_list_item_1 
   so NO separate row.xml file needed in res/layouts

    Note: ListActivity used as the subclass - so this automatically links to the listview without findViewByID;
	You must have a particular ID for your listview.  You don't need to declare a listener in lists that used
	List Activity. 
	
	If you are using AppCompActivity as your subclass, you have to do do more of the list tasks - see notes.
*/
import android.app.ListActivity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;

public class MainActivityPart1 extends ListActivity
{


    // For now, we're just declaring the array in here directly. Better to put it external in arrays.xml in resources

    String[] countries= {"South Africa", "France", "Spain", "Germany", "Finland", "Ireland", "England"};

    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setListAdapter(new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, countries));
    }
}
