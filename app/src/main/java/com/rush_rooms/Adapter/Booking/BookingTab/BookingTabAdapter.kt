package com.rush_rooms.Adapter.Booking.BookingTab

import android.content.Context
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import com.rush_rooms.Fragment.Booking.ActiveFragment
import com.rush_rooms.Fragment.Booking.CancelledFragment
import com.rush_rooms.Fragment.Booking.CompletedFragment
import com.rush_rooms.Fragment.Booking.PendingFragment

class BookingTabAdapter(
    var con: Context,
    fm: FragmentManager,
    var totalTabs: Int
) : FragmentPagerAdapter(fm) {
    override fun getCount(): Int {
        return totalTabs
    }

    override fun getItem(position: Int): Fragment {
        return when (position) {
            0 -> {
                ActiveFragment()
            }
            1 -> {
                PendingFragment()
            }
            2 -> {
                CompletedFragment()
            }
            3 -> {
                CancelledFragment()
            }
            else -> getItem(position)
        }
    }
}