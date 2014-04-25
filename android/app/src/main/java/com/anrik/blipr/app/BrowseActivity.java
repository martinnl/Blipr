package com.anrik.blipr.app;

import android.content.Intent;
import android.content.IntentSender;
import android.content.IntentSender.SendIntentException;
import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ProgressBar;
import android.widget.Toast;
import android.widget.TextView;
import android.view.View;
import android.util.Log;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFile.DownloadProgressListener;
import com.google.android.gms.drive.DriveApi.ContentsResult;
import com.google.android.gms.drive.DriveResource.MetadataResult;
import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.OpenFileActivityBuilder;

public class BrowseActivity extends Activity implements ConnectionCallbacks,
        OnConnectionFailedListener {
    private static final String TAG = "blipr";

    private static final int REQUEST_CODE_RESOLUTION = 1;
    private static final int REQUEST_CODE_OPENER = 2;

    private static final String LBL_ERROR = "!ERROR!";

    private GoogleApiClient mGoogleApiClient;
    private DriveFile mOpenFile;
    private DriveId mFileToOpen;
    private Boolean firstOpen = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_browse);

        // TODO(bluecmd): add retaining fragments for playback data
    }

    public void onOpenBlipButtonClick(View v) {
        openNewBlip();
    }

    private void nowBlipping(String s) {
        TextView t = (TextView) findViewById(R.id.nowBlipping);
        t.setText(s);
    }

    private void openNewBlip() {
        firstOpen = false;
        IntentSender intentSender = Drive.DriveApi
                .newOpenFileActivityBuilder()
                .setMimeType(new String[] { "application/octet-stream" })
                .build(mGoogleApiClient);
        try {
            startIntentSenderForResult(
                    intentSender, REQUEST_CODE_OPENER, null, 0, 0, 0);
        } catch (SendIntentException e) {
            Log.w(TAG, "Unable to send intent", e);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d(TAG, "onResume");
        if (mGoogleApiClient == null) {
            mGoogleApiClient = new GoogleApiClient.Builder(this)
                    .addApi(Drive.API)
                    .addScope(Drive.SCOPE_FILE)
                    .addConnectionCallbacks(this)
                    .addOnConnectionFailedListener(this)
                    .build();
        }
        mGoogleApiClient.connect();
    }

    @Override
    protected void onPause() {
        Log.d(TAG, "onPause");
        if (mGoogleApiClient != null) {
            mGoogleApiClient.disconnect();
        }
        super.onPause();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.browse, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onActivityResult(final int requestCode, final int resultCode,
                                    final Intent data) {
        Log.i(TAG, "Activity: " + Integer.toString(requestCode));
        Log.i(TAG, "Result: " + Integer.toString(resultCode));
        if (requestCode == REQUEST_CODE_OPENER && resultCode == RESULT_OK) {
            mFileToOpen = (DriveId) data.getParcelableExtra(
                    OpenFileActivityBuilder.EXTRA_RESPONSE_DRIVE_ID);
        } else {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    @Override
    public void onConnectionFailed(ConnectionResult result) {
        Log.i(TAG, "GoogleApiClient connection failed: " + result.toString());
        if (!result.hasResolution()) {
            GooglePlayServicesUtil.getErrorDialog(result.getErrorCode(), this, 0).show();
            return;
        }
        try {
            result.startResolutionForResult(this, REQUEST_CODE_RESOLUTION);
        } catch (SendIntentException e) {
            Log.e(TAG, "Exception while starting resolution activity", e);
        }
    }

    @Override
    public void onConnected(Bundle connectionHint) {
        Log.i(TAG, "GoogleApiClient connected");
        if (mFileToOpen != null) {
            open();
        }
    }

    @Override
    public void onConnectionSuspended(int cause) {
        Log.i(TAG, "GoogleApiClient connection suspended");
    }

    private void open() {
        // Reset progress dialog back to zero as we're
        // initiating an opening request.
        final ProgressBar progressBar = (ProgressBar) findViewById(R.id.progressBar);
        progressBar.setProgress(0);
        DownloadProgressListener listener = new DownloadProgressListener() {
            @Override
            public void onProgress(long bytesDownloaded, long bytesExpected) {
                // Update progress dialog with the latest progress.
                // TODO(bluecmd): for some reason 100% = 200 below, weird.
                int progress = (int)(bytesDownloaded*100/bytesExpected);
                Log.d(TAG, String.format("Loading progress: %d percent", progress));
                progressBar.setProgress(progress);
            }
        };
        mOpenFile = Drive.DriveApi.getFile(mGoogleApiClient, mFileToOpen);
        mOpenFile.openContents(mGoogleApiClient, DriveFile.MODE_READ_ONLY, listener)
            .setResultCallback(contentsCallback);
        mFileToOpen = null;
    }

    public void showMessage(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    private ResultCallback<ContentsResult> contentsCallback = new ResultCallback<ContentsResult>() {
        @Override
        public void onResult(ContentsResult result) {
            if (!result.getStatus().isSuccess()) {
                showMessage("Error while opening the file contents");
                nowBlipping(LBL_ERROR);
                return;
            }
            showMessage("File contents opened");
            mOpenFile.getMetadata(mGoogleApiClient).setResultCallback(new
                    ResultCallback<MetadataResult>() {
                        @Override
                        public void onResult(MetadataResult result) {
                            if (!result.getStatus().isSuccess()) {
                                showMessage("Problem while trying to fetch metadata");
                                nowBlipping("???");
                                return;
                            }
                            Metadata metadata = result.getMetadata();
                            nowBlipping(metadata.getTitle().toUpperCase().replace(".YM" ,""));
                        }
                    });
            ProgressBar progressBar = (ProgressBar) findViewById(R.id.progressBar);
            progressBar.setProgress(200);
        }
    };
}
