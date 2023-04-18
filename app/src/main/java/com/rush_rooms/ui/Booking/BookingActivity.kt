package com.rush_rooms.ui.Booking

import android.app.Dialog
import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.LayoutInflater
import android.view.Window
import android.view.WindowManager
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.rush_rooms.Adapter.SortByAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityBookingDetailsBinding
import com.rush_rooms.databinding.NegotiateBottomSheetBinding
import com.rush_rooms.databinding.SortBottomLayBinding
import com.rush_rooms.ui.PaymentConfirm.PaymentConfirmActivity

class BookingActivity : AppCompatActivity() {
    lateinit var binding: ActivityBookingDetailsBinding
    lateinit var bottomSheetDialog: BottomSheetDialog
    lateinit var nego_by_bottom: NegotiateBottomSheetBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBookingDetailsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.bookingDetailsToolbar.tvTittle.text = getString(R.string.booking)
        nego_by_bottom = NegotiateBottomSheetBinding.inflate(LayoutInflater.from(this))
        bottomSheetDialog = BottomSheetDialog(this, R.style.CustomBottomSheetDialogTheme).apply {
            setContentView(nego_by_bottom.root)
            nego_by_bottom.acceotBtn.tvCommonTitle.text = getString(R.string.accpet_offer)
            nego_by_bottom.acceotBtn.tvCommonTitle.setOnClickListener {
                bottomSheetDialog.dismiss()
            }
            nego_by_bottom.layBargain.setOnClickListener {
                bottomSheetDialog.dismiss()
                bargainPopup()
            }
        }

    }

    private fun lstnr() {
        binding.bookingDetailsToolbar.ivBack.setOnClickListener {
            finish()
        }
        binding.layBargain.setOnClickListener {
            bargainPopup()
        }
        binding.constraintLayout12.setOnClickListener {
            startActivity(Intent(this,PaymentConfirmActivity::class.java))
            finish()
        }

    }

    private fun bargainPopup() {
        val dialog = this.let { Dialog(this) }
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setContentView(R.layout.bargain_popup)
        dialog.window!!.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        dialog.setCanceledOnTouchOutside(false)
        dialog.show()
        val btcross = dialog.findViewById<ImageView>(R.id.ivCrossBargain)
        val btconfrm = dialog.findViewById<TextView>(R.id.tvCommonTitleBargain)

        btcross.setOnClickListener {
            dialog.dismiss()
        }
        btconfrm.setOnClickListener {
            dialog.dismiss()
            bottomSheetDialog.show()
        }

        val window = dialog.window
        if (window != null) {
            window.setLayout(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.WRAP_CONTENT
            )
        }
    }





}