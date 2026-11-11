package br.com.biologix.utility

import android.annotation.SuppressLint
import android.app.Notification
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import android.os.SystemClock
import android.provider.Settings
import android.util.Log
import android.view.View
import android.widget.RemoteViews
import androidx.core.content.ContextCompat
import com.istornz.live_activities.LiveActivityManager
import java.util.Locale

enum class NotificationStyle {
    CLASSIC,
    NEW
}

class CustomLiveActivityManager(context: Context) :
    LiveActivityManager(context) {
    private val context: Context = context.applicationContext
    private val pendingIntent = PendingIntent.getActivity(
        context, 200, Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_REORDER_TO_FRONT
        }, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
    )

    @SuppressLint("RemoteViewLayout")
    private val remoteViews = RemoteViews(
        context.packageName, R.layout.live_activity
    )

    private fun updateRemoteViews(
        title: String,
        subTitle: String,
        startDate: Long,
        logoByte: ByteArray?,
        iconBodystarByte: ByteArray?,
        iconOxistarByte: ByteArray?,
        iconMicByte: ByteArray?,
    ) {
        remoteViews.setTextViewText(R.id.title_text, title)
        remoteViews.setTextViewText(R.id.subtitle_text, subTitle)

        // Set the base time to count up from the startDate
        val base = SystemClock.elapsedRealtime() - (System.currentTimeMillis() - startDate)

        remoteViews.setChronometer(R.id.timer_chronometer, base, null, true)

        val logo = loadBitMap(logoByte)
        val iconBodystar = loadBitMap(iconBodystarByte)
        val iconOxistar = loadBitMap(iconOxistarByte)
        val iconMic = loadBitMap(iconMicByte)

        logo?.let { image ->
            remoteViews.setImageViewBitmap(
                R.id.logo,
                image,
            )
        }

        if (iconBodystar != null) {
            remoteViews.setImageViewBitmap(
                R.id.ic_bodystar,
                iconBodystar,
            )
        } else {
            remoteViews.setViewVisibility(R.id.ic_bodystar, View.GONE)
        }

        if (iconOxistar != null) {
            remoteViews.setImageViewBitmap(
                R.id.ic_oxistar,
                iconOxistar,
            )
        } else {
            remoteViews.setViewVisibility(R.id.ic_oxistar, View.GONE)
        }

        if (iconMic != null) {
            remoteViews.setImageViewBitmap(
                R.id.ic_mic,
                iconMic,
            )
        } else {
            remoteViews.setViewVisibility(R.id.ic_mic, View.GONE)
        }
    }

    private fun loadBitMap(byteArray: ByteArray?): Bitmap? {
        if (byteArray == null) return null
        return try {
            val options = BitmapFactory.Options().apply {
                inSampleSize = 2 // downscale by factor of 2
            }
            BitmapFactory.decodeByteArray(byteArray, 0, byteArray.size, options)
        } catch (e: Exception) {
            Log.e("Bitmap", "Error decoding", e)
            null
        }
    }

    override suspend fun buildNotification(
        notification: Notification.Builder,
        event: String,
        data: Map<String, Any>
    ): Notification {
        val title = data["title"] as String
        val subTitle = data["subTitle"] as String
        val startDateMilliseconds = data["startDateMilliseconds"] as Long

        val logoByte = data["logo"] as? ByteArray
        val iconBodystarByte = data["iconBodystar"] as? ByteArray
        val iconOxistarByte = data["iconOxistar"] as? ByteArray
        val iconMicByte =data["iconMic"] as? ByteArray

        updateRemoteViews(
            title,
            subTitle,
            startDateMilliseconds,
            logoByte,
            iconBodystarByte,
            iconOxistarByte,
            iconMicByte,
        )

        if(getNotificationStyle(context) == NotificationStyle.CLASSIC) {
            //Use custom layout
            return notification
            .setSmallIcon(R.drawable.ic_notification)
            .setOngoing(true)
            .setContentIntent(pendingIntent)
            .setCustomContentView(remoteViews)
            .setCustomBigContentView(remoteViews)
            .setStyle(Notification.BigTextStyle())
            .setCategory(Notification.CATEGORY_SERVICE)
            .setVisibility(Notification.VISIBILITY_PUBLIC)
            .setPriority(Notification.PRIORITY_MAX)
            .build()
        } else {
            //Not use custom layout, use default config notification
            return notification
                .setSmallIcon(R.drawable.ic_notification)
                .setColor(ContextCompat.getColor(context, R.color.green_biologix))
                .setOngoing(true)
                .setContentTitle(title)
                .setContentText(subTitle)
                .setStyle(Notification.BigTextStyle().bigText(subTitle))
                .setCategory(Notification.CATEGORY_SERVICE)
                .setVisibility(Notification.VISIBILITY_PUBLIC)
                .setWhen(startDateMilliseconds)
                .setUsesChronometer(true)
                .setContentIntent(pendingIntent)
                .setPriority(Notification.PRIORITY_MAX)
                .build()
        }
    }

    // You need to pass a Context object to this function to use the ContentResolver
    private fun getNotificationStyle(context: Context): NotificationStyle {
        val manufacturer = Build.MANUFACTURER.lowercase(Locale.getDefault())

        // --- Step 1: Specific check for Xiaomi devices ---
        if (manufacturer == "xiaomi") {
            try {
                // This is the key for MIUI's Control Center setting.
                val styleType = Settings.System.getInt(
                    context.contentResolver,
                    "status_bar_notification_style"
                )

                return if (styleType == 1) {
                    Log.d("NotificationCheck", "Xiaomi device with NEW Control Center.")
                    NotificationStyle.NEW
                } else {
                    Log.d("NotificationCheck", "Xiaomi device with CLASSIC notification shade.")
                    NotificationStyle.CLASSIC
                }
            } catch (e: Exception) {
                // This can happen if the setting doesn't exist or we lack permission.
                // We log the error and proceed to the general checks.
                Log.e("NotificationCheck", "Failed to read Xiaomi setting, falling back.", e)
            }
        }

        // --- Step 2: Fallback to general rules if not Xiaomi or if check failed ---


        // For other devices, use the Android version as a general rule.
        // Before Android 12, the style was consistently classic.
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) { // Android 12
            return NotificationStyle.CLASSIC
        }

        // On Android 12+, most other manufacturers default to the new style.
        return NotificationStyle.NEW
    }
}
