package com.nubank.urlshortener.data;

import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class RetrofitFactory {
    private static RetrofitFactory INSTANCE;

    private final HttpLoggingInterceptor loggingInterceptor;
    private final OkHttpClient httpClient;
    private final Retrofit retrofit;

    static RetrofitFactory getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new RetrofitFactory();
        }
        return INSTANCE;
    }

    private RetrofitFactory() {
        loggingInterceptor = new HttpLoggingInterceptor();
        loggingInterceptor.level(HttpLoggingInterceptor.Level.BODY);

        httpClient = new OkHttpClient.Builder()
                .addInterceptor(loggingInterceptor)
                .build();

        retrofit = new Retrofit.Builder()
                .baseUrl("https://url-shortener-nu.herokuapp.com/api")
                .addConverterFactory(GsonConverterFactory.create())
                .client(httpClient)
                .build();
    }
}
