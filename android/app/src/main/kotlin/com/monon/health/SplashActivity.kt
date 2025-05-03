package com.monon.health

import android.app.Activity
import android.content.Intent
import android.os.Bundle

class SplashActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Start MainActivity after splash screen
        startActivity(Intent(this, MainActivity::class.java))
        finish() // Close SplashActivity so user can't go back to it
    }
}
