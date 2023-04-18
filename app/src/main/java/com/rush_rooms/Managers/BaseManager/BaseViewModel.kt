package com.bountybunch.Managers.BaseManager

import ApiInterface

import androidx.lifecycle.ViewModel
import com.rush_rooms.Helper.ApiClient

import com.rush_rooms.Services.BaseUrlWithRequest.BASE_URL


abstract class BaseViewModel : ViewModel(){


    val apiInterface : ApiInterface by lazy { ApiClient.getApiClient(BASE_URL) }
   // val apiGoogleInterface : ApiInterface by lazy { ApiClient.getApiClient(ParamEnum.GOOGLE_MAP_BASE_URL.theValue() as String) }
}