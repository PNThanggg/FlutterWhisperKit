package com.hoicham.flutter_whisper_kit

import android.app.Activity
import android.content.Context
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlutterWhisperKitPlugin */
class FlutterWhisperKitPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    companion object {
        private const val TAG = "FlutterWhisperKitPlugin"
    }

    private lateinit var channel: MethodChannel

    private var activity: Activity? = null
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_whisper_kit")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }

            "transcribeAudio" -> {
                val audioFilePath = call.argument<String>("filePath")

                if (context == null) {
                    result.error("NO_ACTIVITY", "Plugin not attached to an activity.", null)
                    return
                }

                if (audioFilePath == null || audioFilePath.isEmpty()) {
                    result.error("INVALID_ARGUMENT", "audioFilePath is required.", null)
                    return
                }

                Log.d(TAG, "audioFilePath = $audioFilePath")
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        context = binding.activity.applicationContext
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
        context = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        context = binding.activity.applicationContext
    }

    override fun onDetachedFromActivity() {
        activity = null
        context = null
    }
}
