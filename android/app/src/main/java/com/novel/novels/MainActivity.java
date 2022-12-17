package com.novel.novels;

import android.os.Bundle;
import android.view.WindowManager;

import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }
}
