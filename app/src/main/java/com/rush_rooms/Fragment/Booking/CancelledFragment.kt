package com.rush_rooms.Fragment.Booking

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.Booking.CommonAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.FragmentCancelledBinding

class CancelledFragment : Fragment(),CommonAdapter.Click {
    lateinit var binding:FragmentCancelledBinding
    private var adpter: CommonAdapter? = null
    private var changeText = "Cancelled"
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        binding = FragmentCancelledBinding.inflate(layoutInflater)
        initView()
        lstnr()
        return binding.root
    }

    private fun initView() {
        binding.rvCan.layoutManager = LinearLayoutManager(requireContext())
        adpter = CommonAdapter(requireContext(),changeText,this)
        binding.rvCan.adapter = adpter
        adpter!!.notifyDataSetChanged()

    }

    private fun lstnr() {

    }

    override fun onCheckIn(pos: Int) {
        TODO("Not yet implemented")
    }

    override fun onCheckOut(pos: Int) {
        TODO("Not yet implemented")
    }

}