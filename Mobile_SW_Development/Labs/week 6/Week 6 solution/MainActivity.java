package com.example.susan.myapplication;

import android.app.Activity;
import android.database.Cursor;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import android.app.ListActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends Activity {
    /** Called when the activity is first created. */
    DatabaseExample db;

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        db = new DatabaseExample(this);

        db.open();

        addRows();

        Cursor c = db. getAllPeople();
        Log.i("test", "number of rows returned are" + c.getCount());

        db.close();

    }

    //---add some people---
    public void addRows()
    {
        long id;
        id = db.insertPerson(
                "Johny",
                "Fox",
                "Dublin");

        id = db.insertPerson(
                "Sarah",
                "Brown",
                "Monaghan");
    }


}


