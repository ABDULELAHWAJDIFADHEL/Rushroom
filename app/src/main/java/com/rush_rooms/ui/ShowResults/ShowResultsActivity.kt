package com.rush_rooms.ui.ShowResults

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import androidx.lifecycle.VIEW_MODEL_STORE_OWNER_KEY
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.rush_rooms.Adapter.FilterShowAdapter
import com.rush_rooms.Adapter.SortByAdapter
import com.rush_rooms.Adapter.WishListAdapter
import com.rush_rooms.Model.FilterShowModel
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityShowResultsBinding
import com.rush_rooms.databinding.SortBottomLayBinding
import com.rush_rooms.ui.Filter.FilterActivity
import com.rush_rooms.ui.Main.MainActivity

class ShowResultsActivity : AppCompatActivity(), FilterShowAdapter.Click {
    lateinit var binding: ActivityShowResultsBinding
    private var filterShow_adptr: FilterShowAdapter? = null
    private var wishListAdapter: WishListAdapter? = null
    lateinit var bottomSheetDialog: BottomSheetDialog
    lateinit var bottomSheetDialog1: BottomSheetDialog
    lateinit var sort_by_bottom: SortBottomLayBinding
    private var changeTest = "Show"
    lateinit var direction_by_bottom: SortBottomLayBinding
    private var sortby_adptr: SortByAdapter? = null
    private var filterList = ArrayList<FilterShowModel>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityShowResultsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.update_search)
        filterList.add(FilterShowModel("Available"))
        filterList.add(FilterShowModel("Offers"))
        filterList.add(FilterShowModel("Sort"))
        filterList.add(FilterShowModel("Direction"))
        filterList.add(FilterShowModel("Available"))
        filterList.add(FilterShowModel("Offers"))
        binding.rvFilterShow.layoutManager =
            LinearLayoutManager(this, RecyclerView.HORIZONTAL, false)
        filterShow_adptr = FilterShowAdapter(this, filterList, this)
        binding.rvFilterShow.adapter = filterShow_adptr
        filterShow_adptr!!.notifyDataSetChanged()

        binding.rvshow.layoutManager =
            LinearLayoutManager(this)
        wishListAdapter = WishListAdapter(this,changeTest)
        binding.rvshow.adapter = wishListAdapter
        wishListAdapter!!.notifyDataSetChanged()


    }

    private fun sort_by_BottomSheet() {
        sort_by_bottom = SortBottomLayBinding.inflate(LayoutInflater.from(this))
        bottomSheetDialog = BottomSheetDialog(this, R.style.CustomBottomSheetDialogTheme).apply {
            setContentView(sort_by_bottom.root)
            sort_by_bottom.rvSortby.layoutManager = LinearLayoutManager(this@ShowResultsActivity)
            sortby_adptr = SortByAdapter(this@ShowResultsActivity)
            sort_by_bottom.rvSortby.adapter = sortby_adptr
            sortby_adptr!!.notifyDataSetChanged()


        }
        bottomSheetDialog.show()
    }

    private fun direction_BottomSheet() {
        direction_by_bottom = SortBottomLayBinding.inflate(LayoutInflater.from(this))
        bottomSheetDialog1 = BottomSheetDialog(this, R.style.CustomBottomSheetDialogTheme).apply {
            setContentView(direction_by_bottom.root)
            direction_by_bottom.textView63.text = "Direction"
            direction_by_bottom.rvSortby.layoutManager =
                LinearLayoutManager(this@ShowResultsActivity)
            sortby_adptr = SortByAdapter(this@ShowResultsActivity)
            direction_by_bottom.rvSortby.adapter = sortby_adptr
            sortby_adptr!!.notifyDataSetChanged()


        }
        bottomSheetDialog1.show()
    }

    private fun lstnr() {
        binding.ivUpArrow.setOnClickListener {
            if (binding.editLay.visibility == View.GONE) {
                binding.editLay.visibility = View.VISIBLE
                binding.ivUpArrow.visibility = View.GONE
                binding.ivDownArrow.visibility = View.VISIBLE
            }
        }
        binding.ivDownArrow.setOnClickListener {
            if (binding.editLay.visibility == View.VISIBLE) {
                binding.editLay.visibility = View.GONE
                binding.ivUpArrow.visibility = View.VISIBLE
                binding.ivDownArrow.visibility = View.GONE
            }
        }
        binding.ivHome.setOnClickListener {
            startActivity(
                Intent(
                    this,
                    MainActivity::class.java
                ).setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            )
            finish()
        }
        binding.ivFilter.setOnClickListener {
            startActivity(Intent(this, FilterActivity::class.java))
        }

    }

    override fun onClick(pos: Int) {
        if (pos == 2) {
            sort_by_BottomSheet()
        } else if (pos == 3) {
            direction_BottomSheet()
        }

    }
}