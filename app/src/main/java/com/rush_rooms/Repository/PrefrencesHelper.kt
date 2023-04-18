package com.VB_Healthtech_Pvt_Ltd.Vaccine_Buddy.ui.view.Repository

import com.rush_rooms.Constants.MyConstants.*
import android.content.Context
import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity


object PrefrencesHelper {

    fun writePrefrencesValue(context: Context): SharedPreferences.Editor {
        return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE).edit()
    }


    fun getPrefrenceStringValue(context: Context, KEY: String): String {
        return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE).getString(KEY, "")
            .toString()
    }

/*
    fun getLanguage(context: Context?): String {
        val shred = context?.getSharedPreferences("language", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("language", "") ?: ""
    }*/

    fun setLanguage(context: Context, language: String) {
        writePrefrencesValue(context).apply() {
            putString(languageType, language)
        }.apply()
    }

    fun getSaveDeviceID(context: Context?, deviceID: String?) {
        val shred = context?.getSharedPreferences("deviceID", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("deviceID", deviceID)?.apply()
    }

    fun setSaveDeviceID(context: Context?): String {
        val shred = context?.getSharedPreferences("deviceID", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("deviceID", "") ?: ""
    }

    fun getSaveToken(context: Context?, token: String) {
        val shred = context?.getSharedPreferences("token", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("token", token)?.apply()
    }

    fun setSaveToken(context: Context?): String {
        val shred = context?.getSharedPreferences("token", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("token", "") ?: ""
    }

    fun saveLoginStatus(context: Context?, key: Boolean) {
        val shred = context?.getSharedPreferences(kisloginStatus, AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putBoolean(kisloginStatus, key)?.apply()
    }

    fun getLoginStatus(context: Context?): Boolean {
        val shred = context?.getSharedPreferences(kisloginStatus, AppCompatActivity.MODE_PRIVATE)
        return shred?.getBoolean(kisloginStatus, false) ?: false
    }
    fun saveTutorialStatus(context: Context?, key: Boolean) {
        val shred = context?.getSharedPreferences(kisTutorialStatus, AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putBoolean(kisTutorialStatus, key)?.apply()
    }

    fun getTutorialStatus(context: Context?): Boolean {
        val shred = context?.getSharedPreferences(kisTutorialStatus, AppCompatActivity.MODE_PRIVATE)
        return shred?.getBoolean(kisTutorialStatus, true) ?: true
    }

    ///cart_id_list_start
    fun saveCartIDList(context: Context?, cart: ArrayList<String>) {
        val shred = context?.getSharedPreferences("cartIDList", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("cartIDList",cart.toString())?.apply()
    }

    fun getCartIDList(context: Context?): String {
        val shred = context?.getSharedPreferences("cartIDList", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("cartIDList", "") ?: ""
    }

    fun saveMedicalCondtions(context: Context?, medical: String) {
        val shred = context?.getSharedPreferences("medical", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("medical", medical)?.apply()
    }

    fun getMedicalCondtions(context: Context?): String {
        val shred = context?.getSharedPreferences("medical", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("medical", "") ?: ""
    }
    fun saveAnyReaction(context: Context?, anyReaction: String) {
        val shred = context?.getSharedPreferences("anyReaction", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("anyReaction", anyReaction)?.apply()
    }

    fun getAnyReactionm(context: Context?): String {
        val shred = context?.getSharedPreferences("anyReaction", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("anyReaction", "") ?: ""
    }

    ///cart_id_list_End
    ////login
    fun saveEmail_Phone(context: Context?, email_phone: String) {
        val shred = context?.getSharedPreferences("email_phone", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("email_phone", email_phone)?.apply()
    }

    fun getEmail_Phone(context: Context?): String {
        val shred = context?.getSharedPreferences("email_phone", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("email_phone", "") ?: ""
    }

    fun saveLogin_pass(context: Context?, pass: String) {
        val shred = context?.getSharedPreferences("pass", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("pass", pass)?.apply()
    }

    fun getLogin_pass(context: Context?): String {
        val shred = context?.getSharedPreferences("pass", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("pass", "") ?: ""
    }
////login_end

    /////////account Details
    fun saveFullName(context: Context?, fullName: String) {
        val shred = context?.getSharedPreferences("fullName", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("fullName", fullName)?.apply()
    }

    fun getFullName(context: Context?): String {
        val shred = context?.getSharedPreferences("fullName", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("fullName", "") ?: ""
    }
    fun saveEmail(context: Context?, fullName: String) {
        val shred = context?.getSharedPreferences("email", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("email", fullName)?.apply()
    }

    fun getEmail(context: Context?): String {
        val shred = context?.getSharedPreferences("email", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("email", "") ?: ""
    }

    fun saveDate(context: Context?, date: String) {
        val shred = context?.getSharedPreferences("date", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("date", date)?.apply()
    }

    fun getDate(context: Context?): String {
        val shred = context?.getSharedPreferences("date", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("date", "") ?: ""
    }

    fun saveGender(context: Context?, gender: String) {
        val shred = context?.getSharedPreferences("gender", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("gender", gender)?.apply()
    }

    fun getGender(context: Context?): String {
        val shred = context?.getSharedPreferences("gender", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("gender", "") ?: ""
    }

    fun saveRefCode(context: Context?, refcode: String) {
        val shred = context?.getSharedPreferences("refcode", AppCompatActivity.MODE_PRIVATE)
        shred?.edit()?.putString("refcode", refcode)?.apply()
    }

    fun getRefCode(context: Context?): String {
        val shred = context?.getSharedPreferences("refcode", AppCompatActivity.MODE_PRIVATE)
        return shred?.getString("refcode", "") ?: ""
    }
}
