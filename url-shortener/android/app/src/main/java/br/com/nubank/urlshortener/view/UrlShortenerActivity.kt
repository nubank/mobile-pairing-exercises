package br.com.nubank.urlshortener.view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.com.nubank.urlshortener.R

class UrlShortenerActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_url_shortener)
    }
}