package com.example.susanmckeever.lists;

/*

  Part 2 of the lab: this time, we have a slightly customised row.  Our case is simple
  enough that we can still use an off the shelf Array Adapter, but we need another layout as we're no longer
  just displaying a one column list.  We create a second layout file (i.e. we will need need our layout with th e<Listview>),
  and we call this layout row.xml, by convention. This define the actual layout of a single row.

 */

import android.app.ListActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;

public class MainActivityPart2 extends ListActivity
{

    // For now, we're just declaring the array in here directly. Better to put it external in arrays.xml in resources
     String[] countries = {"South Africa", "France", "Spain", "Germany", "Finland", "Ireland", "England"};

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ArrayAdapter adapter = new ArrayAdapter<String>(
                this,
                R.layout.row,
                R.id.country,
                countries);

        setListAdapter(adapter);

    }
}
