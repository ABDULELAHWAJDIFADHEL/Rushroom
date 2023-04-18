package com.rush_rooms.Fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.rush_rooms.Adapter.Map.TimeAdapter
import com.rush_rooms.Adapter.MapBottomSheet.MapBottomSheetAdapter
import com.rush_rooms.Adapter.SortByAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.FragmentMapBinding
import com.rush_rooms.databinding.MapBottomSheetBinding
import com.rush_rooms.databinding.SortBottomLayBinding


class MapFragment : Fragment() {
    lateinit var binding: FragmentMapBinding
    private var adptr: TimeAdapter? = null
    lateinit var bottomSheetDialog: BottomSheetDialog
    lateinit var map_bottom: MapBottomSheetBinding
    private var mapBottomSheetAdapter: MapBottomSheetAdapter? = null
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentMapBinding.inflate(layoutInflater)
        initView()
        lstnr()
        return (binding.root)
    }

    private fun initView() {
        binding.rvTime.layoutManager =
            LinearLayoutManager(requireContext(), RecyclerView.HORIZONTAL, false)
        adptr = TimeAdapter(requireContext())
        binding.rvTime.adapter = adptr
        adptr!!.notifyDataSetChanged()

    }

    private fun lstnr() {
        binding.mapLay.setOnClickListener {
            map_BottomSheet()
        }

    }

    private fun map_BottomSheet() {
        map_bottom = MapBottomSheetBinding.inflate(LayoutInflater.from(requireContext()))
        bottomSheetDialog =
            BottomSheetDialog(requireContext(), R.style.CustomBottomSheetDialogTheme).apply {
                setContentView(map_bottom.root)
                map_bottom.rvMapBottomSheet.layoutManager = LinearLayoutManager(requireContext())
                mapBottomSheetAdapter = MapBottomSheetAdapter(requireContext())
                map_bottom.rvMapBottomSheet.adapter = mapBottomSheetAdapter
                mapBottomSheetAdapter!!.notifyDataSetChanged()


            }
        bottomSheetDialog.show()
    }


}