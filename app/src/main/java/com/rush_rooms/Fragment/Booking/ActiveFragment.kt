package com.rush_rooms.Fragment.Booking

import android.app.Dialog
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.view.*
import androidx.fragment.app.Fragment
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.Booking.CommonAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.FragmentActiveBinding


class ActiveFragment : Fragment(), CommonAdapter.Click {
    lateinit var binding: FragmentActiveBinding
    private var adpter: CommonAdapter? = null
    private var changeText = "Active"
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentActiveBinding.inflate(layoutInflater)
        initView()
        lstnr()
        return binding.root
    }

    private fun initView() {
        binding.rvActive.layoutManager = LinearLayoutManager(requireContext())
        adpter = CommonAdapter(requireContext(), changeText, this)
        binding.rvActive.adapter = adpter
        adpter!!.notifyDataSetChanged()

    }

    private fun lstnr() {

    }

    override fun onCheckIn(pos: Int) {
        checkInPopup()
    }

    override fun onCheckOut(pos: Int) {
        checkOutPopup()
    }

    private fun checkInPopup() {
        val dialog = this.let { Dialog(requireContext()) }
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setContentView(R.layout.checkin_popup)
        dialog.window!!.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        dialog.setCanceledOnTouchOutside(false)
        dialog.show()
        val btcheckIn = dialog.findViewById<TextView>(R.id.tvCheckInPopup)
//        val btconfrm = dialog.findViewById<TextView>(R.id.tvCommonTitleBargain)

        btcheckIn.setOnClickListener {
            dialog.dismiss()
        }
        val window = dialog.window
        if (window != null) {
            window.setLayout(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.WRAP_CONTENT
            )
        }
    }

    private fun checkOutPopup() {
        val dialog = this.let { Dialog(requireContext()) }
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setContentView(R.layout.check_out_popup)
        dialog.window!!.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        dialog.setCanceledOnTouchOutside(false)
        dialog.show()
        val btuploadVideos = dialog.findViewById<TextView>(R.id.tvbtnUploadVideo)
        val btuploadImage = dialog.findViewById<TextView>(R.id.tvbtnUploadImage)

        btuploadVideos.setOnClickListener {
            dialog.dismiss()
            uploadVideoPopup()
        }
        btuploadImage.setOnClickListener {
            dialog.dismiss()
            uploadImagePopup()

        }
        val window = dialog.window
        if (window != null) {
            window.setLayout(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.WRAP_CONTENT
            )
        }
    }

    private fun uploadVideoPopup() {
        val dialog = this.let { Dialog(requireContext()) }
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setContentView(R.layout.uplaod_video_popup)
        dialog.window!!.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        dialog.setCanceledOnTouchOutside(false)
        dialog.show()
        val btDone = dialog.findViewById<TextView>(R.id.tvbtnDone)
        val btReUpload = dialog.findViewById<TextView>(R.id.tvbtnReUpload)

        btDone.setOnClickListener {
            dialog.dismiss()
        }
        btReUpload.setOnClickListener {
            dialog.dismiss()
            uploadVideoPopup()

        }
        val window = dialog.window
        if (window != null) {
            window.setLayout(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.WRAP_CONTENT
            )
        }
    }

    private fun uploadImagePopup() {
        val dialog = this.let { Dialog(requireContext()) }
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setContentView(R.layout.upload_image_popup)
        dialog.window!!.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        dialog.setCanceledOnTouchOutside(false)
        dialog.show()
        val btDone = dialog.findViewById<TextView>(R.id.tvbtnDoneUploadImage)
        val btReUpload = dialog.findViewById<TextView>(R.id.tvbtnReUploadImage)

        btDone.setOnClickListener {
            dialog.dismiss()
        }
        btReUpload.setOnClickListener {
            dialog.dismiss()
            uploadImagePopup()
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