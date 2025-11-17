package com.xkeyc.syncreve

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.util.Log
import mobile.Mobile

class SyncreveService : Service() {

    companion object {
        const val NOTIFICATION_CHANNEL_ID = "Service"
        const val SERVICE_ID = 1
    }

    private var notification: Notification? = null

    override fun onBind(intent: Intent): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent != null) {
            val workingDir = intent.getStringExtra("workingDir")
            if (workingDir != null && !Mobile.isServiceRunning()) {
                Log.d("[SyncreveService]", "Starting service with workingDir: $workingDir")
                Mobile.startService(workingDir)
            }
        }
        return super.onStartCommand(intent, flags, startId)
    }

    override fun stopService(name: Intent?): Boolean {
        stop()
        return super.stopService(name)
    }

    override fun onDestroy() {
        stop()
        super.onDestroy()
    }

    private fun stop() {
        Mobile.stopService()
    }

    override fun onCreate() {
        super.onCreate()
        val notificationManager: NotificationManager = application
            .getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val mChannel = NotificationChannel(
                NOTIFICATION_CHANNEL_ID, "Syncreve Service",
                NotificationManager.IMPORTANCE_LOW
            )
            notificationManager.createNotificationChannel(mChannel)
            notification = Notification.Builder(applicationContext, NOTIFICATION_CHANNEL_ID)
                .setContentTitle("Syncreve Service Running").build()
            startForeground(SERVICE_ID, notification)
        }
    }
}