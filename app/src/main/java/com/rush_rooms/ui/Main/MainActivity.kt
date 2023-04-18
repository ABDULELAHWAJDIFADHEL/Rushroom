package com.rush_rooms.ui.Main

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.WindowManager
import android.widget.Toast

import androidx.fragment.app.Fragment
import com.rush_rooms.Fragment.*
import com.rush_rooms.R

import com.rush_rooms.databinding.ActivityMainBinding
import com.rush_rooms.ui.Profile.ProfileActivity


class MainActivity : AppCompatActivity(), View.OnClickListener {
    lateinit var binding: ActivityMainBinding
    var doubleBackToExitPressedOnce = false
    val fragHome = HomeFragment()
    val fragchat = ChatFragment()
    val fragSetting = SettingFragment()
    val fragBooking = BookingFragment()
    val fragMap = MapFragment()

    companion object {
        fun getIntent(context: Context?): Intent {
            return Intent(context, MainActivity::class.java)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initCtrl()
        onSelectView("Map")

    }

    private fun initCtrl() {
        binding.ivDis.setOnClickListener(this)
        binding.ivBooking.setOnClickListener(this)
        binding.ivMap.setOnClickListener(this)
        binding.ivChat.setOnClickListener(this)
        binding.ivSetting.setOnClickListener(this)
    }

    override fun onClick(p0: View?) {
        when (p0?.id) {
            R.id.iv_dis -> {
                onSelectView("Dis")
                window.statusBarColor = resources.getColor(R.color.light_grey)
            }
            R.id.iv_booking -> {
                onSelectView("Booking")
                window.statusBarColor = resources.getColor(R.color.light_grey)
            }
            R.id.iv_Map -> {
                onSelectView("Map")
                window.statusBarColor = resources.getColor(R.color.light_grey)
            }
            R.id.iv_Chat -> {
                onSelectView("Chat")
                window.statusBarColor = resources.getColor(R.color.light_grey)
            }
            R.id.iv_Setting -> {
                onSelectView("Setting")
                window.statusBarColor = resources.getColor(R.color.black)
            }
        }
    }

    private fun onSelectView(from: String) {
        if (from == "Dis") {
            binding.ivDis.setImageDrawable(resources.getDrawable(R.drawable.home_checked))
            binding.tvHome.setTextColor(getColor(R.color.black))
            binding.tvBooking.setTextColor(getColor(R.color.dark_gray))
            binding.tvMap.setTextColor(getColor(R.color.dark_gray))
            binding.tvSetting.setTextColor(getColor(R.color.dark_gray))
            binding.tvChat.setTextColor(getColor(R.color.dark_gray))
            binding.ivBooking.setImageDrawable(resources.getDrawable(R.drawable.booking_new_unchecked))
            binding.ivMap.setImageDrawable(resources.getDrawable(R.drawable.map_unchecked))
            binding.ivChat.setImageDrawable(resources.getDrawable(R.drawable.chat_unchecked))
            binding.ivSetting.setImageDrawable(resources.getDrawable(R.drawable.setting_unchecked))
            replaceFrag(fragHome, "fragHome", null)

        } else if (from == "Booking") {
            binding.ivDis.setImageDrawable(resources.getDrawable(R.drawable.home_unchecked))
            binding.tvBooking.setTextColor(getColor(R.color.black))
            binding.tvHome.setTextColor(getColor(R.color.dark_gray))
            binding.tvMap.setTextColor(getColor(R.color.dark_gray))
            binding.tvSetting.setTextColor(getColor(R.color.dark_gray))
            binding.tvChat.setTextColor(getColor(R.color.dark_gray))
            binding.ivBooking.setImageDrawable(resources.getDrawable(R.drawable.booking_checked))
            binding.ivMap.setImageDrawable(resources.getDrawable(R.drawable.map_unchecked))
            binding.ivChat.setImageDrawable(resources.getDrawable(R.drawable.chat_unchecked))
            binding.ivSetting.setImageDrawable(resources.getDrawable(R.drawable.setting_unchecked))
            replaceFrag(fragBooking, "fragBooking", null)

        } else if (from == "Setting") {
            binding.ivDis.setImageDrawable(resources.getDrawable(R.drawable.home_unchecked))
            binding.tvSetting.setTextColor(getColor(R.color.black))
            binding.tvBooking.setTextColor(getColor(R.color.dark_gray))
            binding.tvHome.setTextColor(getColor(R.color.dark_gray))
            binding.tvMap.setTextColor(getColor(R.color.dark_gray))
            binding.tvChat.setTextColor(getColor(R.color.dark_gray))
            binding.ivBooking.setImageDrawable(resources.getDrawable(R.drawable.booking_new_unchecked))
            binding.ivMap.setImageDrawable(resources.getDrawable(R.drawable.map_unchecked))
            binding.ivChat.setImageDrawable(resources.getDrawable(R.drawable.chat_unchecked))
            binding.ivSetting.setImageDrawable(resources.getDrawable(R.drawable.setting_checked))
            replaceFrag(fragSetting, "fragSetting", null)
        } else if (from == "Map") {
            binding.ivDis.setImageDrawable(resources.getDrawable(R.drawable.home_unchecked))
            binding.tvMap.setTextColor(getColor(R.color.black))
            binding.tvSetting.setTextColor(getColor(R.color.dark_gray))
            binding.tvBooking.setTextColor(getColor(R.color.dark_gray))
            binding.tvHome.setTextColor(getColor(R.color.dark_gray))
            binding.tvChat.setTextColor(getColor(R.color.dark_gray))
            binding.ivBooking.setImageDrawable(resources.getDrawable(R.drawable.booking_new_unchecked))
            binding.ivMap.setImageDrawable(resources.getDrawable(R.drawable.map_checked))
            binding.ivChat.setImageDrawable(resources.getDrawable(R.drawable.chat_unchecked))
            binding.ivSetting.setImageDrawable(resources.getDrawable(R.drawable.setting_unchecked))
            replaceFrag(fragMap, "fragMap", null)

        } else {
            binding.ivDis.setImageDrawable(resources.getDrawable(R.drawable.home_unchecked))
            binding.tvChat.setTextColor(getColor(R.color.black))
            binding.tvSetting.setTextColor(getColor(R.color.dark_gray))
            binding.tvBooking.setTextColor(getColor(R.color.dark_gray))
            binding.tvHome.setTextColor(getColor(R.color.dark_gray))
            binding.tvMap.setTextColor(getColor(R.color.dark_gray))

            binding.ivBooking.setImageDrawable(resources.getDrawable(R.drawable.booking_new_unchecked))
            binding.ivMap.setImageDrawable(resources.getDrawable(R.drawable.map_unchecked))
            binding.ivChat.setImageDrawable(resources.getDrawable(R.drawable.chat_checked))
            binding.ivSetting.setImageDrawable(resources.getDrawable(R.drawable.setting_unchecked))
            replaceFrag(fragchat, "fragchat", null)
        }

    }

    private fun replaceFrag(frag: Fragment, nameTag: String, bundle: Bundle?) {
        if (bundle != null) frag.setArguments(bundle) else frag.setArguments(null)
        supportFragmentManager
            .beginTransaction()
            .replace(R.id.frame, frag, nameTag)
            .addToBackStack(nameTag)
            .commit()
    }
    override fun onBackPressed() {
        if (doubleBackToExitPressedOnce) {
            super.finishAffinity()
            return
        }
        if (supportFragmentManager.findFragmentByTag("fragMap") !=null){
            onSelectView("Map")
        }
        Toast.makeText(this, "Please click BACK again to exit", Toast.LENGTH_SHORT).show()
        Handler(Looper.getMainLooper()).postDelayed(Runnable {
            doubleBackToExitPressedOnce = true
        }, 1000)
    }
}