package com.rush_rooms.ui.Filter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.Filter.PropertyAdapter
import com.rush_rooms.Adapter.Filter.RatingAdapter
import com.rush_rooms.Adapter.Filter.RoomBedAdapter
import com.rush_rooms.Adapter.Filter.ServiceFaciAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityFilterBinding

class FilterActivity : AppCompatActivity() {
    lateinit var binding: ActivityFilterBinding
    private var roomBedAdapter: RoomBedAdapter? = null
    private var serviceAdapter: ServiceFaciAdapter? = null
    private var propertyAdapter: PropertyAdapter? = null
    private var ratingAdapter: RatingAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityFilterBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.rvRooms.layoutManager = LinearLayoutManager(this)
        roomBedAdapter = RoomBedAdapter(this)
        binding.rvRooms.adapter = roomBedAdapter
        roomBedAdapter!!.notifyDataSetChanged()

        binding.rvservice.layoutManager = LinearLayoutManager(this)
        serviceAdapter = ServiceFaciAdapter(this)
        binding.rvservice.adapter = serviceAdapter
        serviceAdapter!!.notifyDataSetChanged()

        binding.rvproperty.layoutManager = LinearLayoutManager(this)
        propertyAdapter = PropertyAdapter(this)
        binding.rvproperty.adapter = propertyAdapter
        propertyAdapter!!.notifyDataSetChanged()

        binding.rvRate.layoutManager = GridLayoutManager(this, 3)
        ratingAdapter = RatingAdapter(this)
        binding.rvRate.adapter = ratingAdapter
        ratingAdapter!!.notifyDataSetChanged()

        binding.applyBtn.tvCommonTitle.text = getString(R.string.apply)


    }

    private fun lstnr() {
        binding.ivCross.setOnClickListener {
            finish()
        }
    }
}