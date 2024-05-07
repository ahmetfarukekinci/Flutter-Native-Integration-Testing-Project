package com.example.sc_rick_and_morty

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.drawable.Drawable
import android.net.Uri
import android.widget.ImageView
import android.widget.RemoteViews
import com.bumptech.glide.Glide
import com.bumptech.glide.request.target.AppWidgetTarget
import com.bumptech.glide.request.target.CustomTarget
import com.bumptech.glide.request.target.SimpleTarget
import com.bumptech.glide.request.transition.Transition
import es.antonborri.home_widget.HomeWidgetPlugin
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.net.URL


/**
 * Implementation of App Widget functionality.
 */
class CharacterHomeWidget : AppWidgetProvider() {

    suspend fun downloadImage(url: String): Bitmap? {
        return withContext(Dispatchers.IO) {
            try {
                val imageUrl = URL(url)
                val connection = imageUrl.openConnection().getInputStream()
                val bitmap = BitmapFactory.decodeStream(connection)
                connection.close()
                bitmap
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        // There may be multiple widgets active, so update all of them
        for (appWidgetId in appWidgetIds) {

        val widgetData = HomeWidgetPlugin.getData(context)
            val views =   RemoteViews(context.packageName, R.layout.character_home_widget)
            val image = widgetData.getString("image","image")
            println("image url $image")


            val awt: AppWidgetTarget = object : AppWidgetTarget(context, R.id.imageView, views, *appWidgetIds) {
                override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
                    super.onResourceReady(resource, transition)
                }
            };

            Glide.with(context).asBitmap().load(image).into(awt)


            val title = widgetData.getString("title","title")
            views.setTextViewText(R.id.appwidget_text,title)
            //views.setImageViewUri(R.id.imageView,imageUri)
            //updateAppWidget(context, appWidgetManager, appWidgetId)
            appWidgetManager.updateAppWidget(appWidgetId,views)
        }
    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }
}

internal fun updateAppWidget(
    context: Context,
    appWidgetManager: AppWidgetManager,
    appWidgetId: Int
) {
    val widgetText = context.getString(R.string.appwidget_text)
    // Construct the RemoteViews object
    val views = RemoteViews(context.packageName, R.layout.character_home_widget)
    views.setTextViewText(R.id.appwidget_text, widgetText)

    // Instruct the widget manager to update the widget
    appWidgetManager.updateAppWidget(appWidgetId, views)
}