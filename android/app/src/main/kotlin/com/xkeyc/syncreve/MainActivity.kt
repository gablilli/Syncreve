package com.xkeyc.syncreve

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.Settings
import android.webkit.MimeTypeMap
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.app.ActivityCompat
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import androidx.core.net.toUri

class MainActivity : FlutterFragmentActivity() {
    companion object {
        const val CHANNEL_NAME = "Syncreve/ServiceChannel"
        const val APPLICATION_ID = "com.xkeyc.syncreve"
    }

    private var launchServiceResult: MethodChannel.Result? = null
    private var launchServicePath: String? = null

    private val requestPermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) {
        launchServiceResult?.success("ok")
        launchServiceResult = null
        startService(launchServicePath)
        launchServicePath = null
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        setupFlutterChannel(flutterEngine)
    }

    private fun setupFlutterChannel(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "startService" -> {
                    try {
                        val workingDir = call.argument<String>("workingDir")
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                            requestPermissionLauncher.launch(
                                Manifest.permission.POST_NOTIFICATIONS
                            )
                            launchServiceResult = result
                            launchServicePath = workingDir
                            return@setMethodCallHandler
                        }
                        startService(workingDir)
                        result.success("ok")
                    } catch (e: Error) {
                        result.error("500", "startServiceError:$e", null)
                    }
                }
                "stopService" -> {
                    try {
                        stopService()
                        result.success("ok")
                    } catch (e: Error) {
                        result.error("500", "startServiceError:$e", null)
                    }
                }
                "getDownloadDir" -> {
                    result.success(getDownloadDir())
                }
                "checkPathPermissions" -> {
                    val path = call.argument<String>("path")
                    checkPathPermissions(path!!, result)
                }
                "openFile" -> {
                    val path = call.argument<String>("path")
                    openFile(path!!)
                    result.success("ok")
                }
            }
        }
    }

    private fun startService(workingDir: String?) {
        val intent = Intent(applicationContext, SyncreveService::class.java)
        intent.putExtra("workingDir", workingDir)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            applicationContext.startForegroundService(intent)
        } else {
            applicationContext.startService(intent)
        }
    }

    private fun stopService() {
        val intent = Intent(this, SyncreveService::class.java)
        stopService(intent)
    }

    private fun getDownloadDir(): String {
        return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).absolutePath
    }

    private fun checkPathPermissions(path: String, result: MethodChannel.Result) {
        // TODO check path
        result.success(checkPermissions())
    }

    private fun checkPermissions(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            if (!Environment.isExternalStorageManager()) {
                val uri = "package:${APPLICATION_ID}".toUri()
                startActivity(
                    Intent(
                        Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION, uri
                    )
                )
                return false
            }
        } else if (ActivityCompat.checkSelfPermission(
                this, Manifest.permission.WRITE_EXTERNAL_STORAGE
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            requestPermissions(
                arrayOf(
                    Manifest.permission.WRITE_EXTERNAL_STORAGE,
                    Manifest.permission.READ_EXTERNAL_STORAGE
                ), 1
            )
            return false
        }
        return true
    }

    private fun openFile(path: String) {
        val file = File(path)
        if (!file.exists()) {
            return
        }
        val intent = Intent(Intent.ACTION_VIEW)
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        val uri: Uri = FileProvider.getUriForFile(this, "$APPLICATION_ID.fileProvider", file)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        intent.setDataAndType(uri, getMimeType(path))
        startActivity(intent)
    }

    private fun getMimeType(url: String?): String? {
        val type: String?
        val extension: String = MimeTypeMap.getFileExtensionFromUrl(url)
        type = MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension)
        return type
    }
}
