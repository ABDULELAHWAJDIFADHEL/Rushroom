package com.rush_rooms.ui.BookingSelection

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityBookingSelectionBinding
import com.rush_rooms.ui.SelectDate.SelectDateActivity

class BookingSelectionActivity : AppCompatActivity() {
    lateinit var binding: ActivityBookingSelectionBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBookingSelectionBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.bookingToolbar.tvTittle.text = getString(R.string.booking_selection)
        binding.confromBtn.tvCommonTitle.text = getString(R.string.continues)

    }

    private fun lstnr() {
        binding.bookingToolbar.ivBack.setOnClickListener {
            finish()
        }
        binding.confromBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, SelectDateActivity::class.java))
        }

    }
}