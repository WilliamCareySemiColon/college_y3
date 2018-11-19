package com.example.susan.locationapp;

        import android.Manifest;
        import android.annotation.TargetApi;
        import android.app.Activity;
        import android.content.Context;
        import android.content.pm.PackageManager;
        import android.location.Address;
        import android.location.Geocoder;
        import android.location.Location;
        import android.location.LocationListener;
        import android.location.LocationManager;
        import android.os.Build;
        import android.os.Bundle;
        import android.support.v4.app.ActivityCompat;
        import android.support.v4.app.NotificationCompatSideChannelService;
        import android.support.v4.content.ContextCompat;
        import android.util.Log;
        import android.view.View;
        import android.view.Menu;
        import android.view.MenuItem;
        import android.widget.TextView;
        import android.widget.Toast;

        import java.util.List;
        import java.util.Locale;


public class MainActivity extends Activity implements LocationListener {

    private TextView mLocationText;
    private TextView locality;
    private LocationManager locationManager;
    private long minTime = 500;
    private float minDistance = 1;
    private static final int MY_PERMISSION_GPS = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mLocationText = (TextView) findViewById(R.id.location);
        locality = (TextView) findViewById(R.id.locality);
        setUpLocation();
    }

    private void setUpLocation()
    {
        locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);

        if (ContextCompat.checkSelfPermission(MainActivity.this,
                Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED)
        {
            ActivityCompat.requestPermissions(MainActivity.this,
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                    MY_PERMISSION_GPS);
        } else {

            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, minTime, minDistance, this);
        }
    }

    public void onLocationChanged(Location location) {
        String latestLocation = "";

        Log.d("GPSLOCATION", "LOCATION CHANGED!");

        if (location != null) {
            latestLocation = String.format(
                    "Current Location: Latitude %1$s Longitude : %2$s",
                    Math.round(location.getLatitude()), Math.round(location.getLongitude()));
            Log.d("GPSLOCATION", "LOCATION forattedd for textview!");

        }
        mLocationText.setText("GPS Location" +"\n" + latestLocation);

        try
        {
            Geocoder geo = new Geocoder(MainActivity.this.getApplicationContext(), Locale.getDefault());
            List<Address> addresses = geo.getFromLocation(location.getLatitude(), location.getLongitude(), 1);
            if (addresses.isEmpty()) {
                locality.setText("Waiting for Location");
            }
            else {
                if (addresses.size() > 0) {
                    String address  = addresses.get(0).getFeatureName() + ", " +
                            addresses.get(0).getLocality() + ", " +
                            addresses.get(0).getAdminArea() + ", " +
                            addresses.get(0).getCountryName();
                    locality.setText (address);
                }
            }
        }
        catch (Exception e)
        {}

    }

    public void onProviderDisabled(String provider) {

    }

    public void onProviderEnabled(String provider) {

    }

    public void onStatusChanged(String provider, int status, Bundle extras) {

    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            case MY_PERMISSION_GPS:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // All good!
                } else {
                    Toast.makeText(this, "Need your location!", Toast.LENGTH_SHORT).show();
                }
                break;
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        setUpLocation();
        Log.i("Lab9", "restarted location updates");

    }




    @Override
    protected void onPause() {
        super.onPause();

        locationManager.removeUpdates(this);
        Log.i("Lab9", "stopped location updates");

    }


}
