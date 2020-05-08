package com.example.volleyarrraccess

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.test.volleynetwork.VolleyUtils

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        VolleyUtils().enableLog()
        Log.d("volley",VolleyUtils().enableLog())
    }
}
