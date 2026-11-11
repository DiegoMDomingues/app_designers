package br.com.biologix.utility

import android.os.Bundle
import br.com.biologix.baselib.BLXHost
import br.com.biologix.baselib.platform.snoring.FlutterSnoringManager
import com.istornz.live_activities.LiveActivityManagerHolder
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // Before super.onCreate(), which is where FlutterActivity starts the engine: the
        // snoring channel handlers registered with it look the host Activity up here.
        BLXHost.attach(this)
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        BLXHost.attach(this)
        super.onResume()
    }

    override fun onDestroy() {
        super.onDestroy()
        BLXHost.detach(this)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        FlutterSnoringManager(flutterEngine.dartExecutor, applicationContext)

        LiveActivityManagerHolder.instance = CustomLiveActivityManager(this)
    }
}
