package com.rush_rooms.Fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.google.android.material.tabs.TabLayout
import com.rush_rooms.Adapter.Booking.BookingTab.BookingTabAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.FragmentBookingBinding


class BookingFragment : Fragment() {
    lateinit var binding: FragmentBookingBinding
    private var viewPager: BookingTabAdapter? = null
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentBookingBinding.inflate(layoutInflater)
        initView()
        lstnr()
        return binding.root

    }

    private fun initView() {
        binding.bookingTolbar.tvTittle.text = getString(R.string.booking)
        binding.bookingTabLay.addTab(binding.bookingTabLay.newTab().setText("Active"))
        binding.bookingTabLay.addTab(binding.bookingTabLay.newTab().setText("Pending"))
        binding.bookingTabLay.addTab(binding.bookingTabLay.newTab().setText("Completed"))
        binding.bookingTabLay.addTab(binding.bookingTabLay.newTab().setText("Cancelled"))

        binding.bookingTabLay.tabGravity = TabLayout.GRAVITY_FILL

        viewPager = BookingTabAdapter(
            requireContext(),
            this.childFragmentManager,
            binding.bookingTabLay.tabCount
        ).apply {
            binding.viewpagr.adapter = this
            binding.bookingTabLay.addOnTabSelectedListener(object :
                TabLayout.OnTabSelectedListener {
                override fun onTabSelected(tab: TabLayout.Tab) {
                    binding.viewpagr.currentItem = tab.position

                }

                override fun onTabUnselected(tab: TabLayout.Tab) {}
                override fun onTabReselected(tab: TabLayout.Tab) {}
            })
        }


    }

    private fun lstnr() {

    }

}

