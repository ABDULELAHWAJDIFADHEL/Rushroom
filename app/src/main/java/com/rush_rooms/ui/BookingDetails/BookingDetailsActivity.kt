package com.rush_rooms.ui.BookingDetails

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.Booking.BookingDetails.FacilityAdapter
import com.rush_rooms.Adapter.Booking.BookingDetails.FoodAdapter
import com.rush_rooms.Adapter.Booking.BookingDetails.PhotoAdapter
import com.rush_rooms.Model.Facility_Modal
import com.rush_rooms.Model.FoodModal
import com.rush_rooms.Model.PhotoModal
import com.rush_rooms.R
import com.rush_rooms.Utils.CommonUtil
import com.rush_rooms.databinding.ActivityBookingDetails2Binding
import com.rush_rooms.ui.Booking.BookingActivity


class BookingDetailsActivity : AppCompatActivity() {
    lateinit var binding: ActivityBookingDetails2Binding
    private var adapter: PhotoAdapter? = null
    private var list = ArrayList<PhotoModal>()

    private var adapter2: FacilityAdapter? = null
    private var list2 = ArrayList<Facility_Modal>()

    private var adapter3: FoodAdapter? = null
    private var list3 = ArrayList<FoodModal>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBookingDetails2Binding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
        CommonUtil.themeSet(this, window)
    }

    private fun initView() {
        binding.btn.tvCommonTitle.text = getString(R.string.book)
        list.add(PhotoModal(R.drawable.room_img, "More 8+"))
        list.add(PhotoModal(R.drawable.room_img, "More 8+"))
        list.add(PhotoModal(R.drawable.room_img, "More 8+"))

        binding.recyclerView.layoutManager =
            LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false)
        adapter = PhotoAdapter(this, list)
        binding.recyclerView.adapter = adapter
        adapter!!.notifyDataSetChanged()

        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "Wifi"))
        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "Breakfast"))
        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "AC"))
        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "Minibar"))
        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "Extinguisher"))
        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "Pet"))
        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "Bathhub"))
        list2.add(Facility_Modal(R.drawable.wifi_signal_img, "CCTV"))


        binding.recyclerView2.layoutManager = GridLayoutManager(this, 4)
        adapter2 = FacilityAdapter(this, list2)
        binding.recyclerView2.adapter = adapter2
        adapter2!!.notifyDataSetChanged()

        list3.add(FoodModal("Free buffet breakfast daily"))
        list3.add(FoodModal("Bar / lounge"))
        list3.add(FoodModal("Barbecue grills"))
        list3.add(FoodModal("Restaurant"))

        binding.recycler3.layoutManager = LinearLayoutManager(this)
        adapter3 = FoodAdapter(this, list3)
        binding.recycler3.adapter = adapter3
        adapter3!!.notifyDataSetChanged()


        binding.downArrow.setOnClickListener {
            if (binding.child.visibility == View.VISIBLE) {
                binding.child.visibility = View.GONE
                binding.upArrow.visibility = View.VISIBLE
                binding.downArrow.visibility = View.GONE
            } else {
                binding.child.visibility = View.VISIBLE
                binding.upArrow.visibility = View.GONE
                binding.downArrow.visibility = View.VISIBLE
            }
        }
        binding.upArrow.setOnClickListener {
            if (binding.child.visibility == View.GONE) {
                binding.child.visibility = View.VISIBLE
                binding.upArrow.visibility = View.GONE
                binding.downArrow.visibility = View.VISIBLE
            } else {
                binding.child.visibility = View.GONE
                binding.upArrow.visibility = View.VISIBLE
                binding.downArrow.visibility = View.GONE
            }
        }

    }

    private fun lstnr() {
        binding.back.setOnClickListener {
            finish()
        }
        binding.btn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, BookingActivity::class.java))
        }

    }
}