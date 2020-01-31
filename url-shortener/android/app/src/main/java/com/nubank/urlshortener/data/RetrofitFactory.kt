package com.nubank.urlshortener.data

import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitFactory {
    private val httpClient by lazy {
        OkHttpClient.Builder()
            .addInterceptor(HttpLoggingInterceptor())
            .build()
    }

    private val retrofit by lazy {
        Retrofit.Builder()
            .baseUrl("https://url-shortener-nu.herokuapp.com/api")
            .addConverterFactory(GsonConverterFactory.create())
            .client(httpClient)
            .build()
    }
}
