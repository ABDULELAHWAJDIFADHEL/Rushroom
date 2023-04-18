package com.rush_rooms.ui.walkThrough

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.WindowManager
import android.widget.ArrayAdapter
import android.widget.Spinner
import androidx.viewpager.widget.ViewPager
import com.rush_rooms.Adapter.TourAdapter
import com.rush_rooms.Model.TourModal
import com.rush_rooms.R
import com.rush_rooms.Utils.CommonUtil
import com.rush_rooms.databinding.ActivityTourBinding
import com.rush_rooms.databinding.TourItemBinding
import com.rush_rooms.ui.Welcome.WelcomeActivity

class TourActivity : AppCompatActivity(),ViewPager.OnPageChangeListener {
    lateinit var binding:ActivityTourBinding
    private val walkthroughmodel: ArrayList<TourModal> = ArrayList()
    private lateinit var spiner:Spinner
    private lateinit var adptrlist:ArrayAdapter<String>
    companion object {
        fun getIntent(context: Context?): Intent {
            return Intent(context, TourActivity::class.java)
        }
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityTourBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
        window.setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        )
    }

    private fun initView() {
        walkthroughmodel.add(TourModal(R.drawable.walk_1,"Find your best Hotel to stay","Adipiscing vitae, id non vitae, elementum, purus fermentum. Mus aliquam pellentesque"))
        walkthroughmodel.add(TourModal(R.drawable.walk_2,"Best apartment and hotel booking","Adipiscing vitae, id non vitae, elementum, purus fermentum. Mus aliquam pellentesque"))
        walkthroughmodel.add(TourModal(R.drawable.walk_3,"Enjoy your holiday time","Adipiscing vitae, id non vitae, elementum, purus fermentum. Mus aliquam pellentesque"))
        binding.viewPager.adapter = TourAdapter(this, walkthroughmodel)
        binding.tabLayout.setupWithViewPager(binding.viewPager, true)
        binding.viewPager.addOnPageChangeListener(this)
        spiner = binding.lang
        var list = resources.getStringArray(R.array.Lang)
        adptrlist = ArrayAdapter(this,R.layout.spinner_dropdown_item,list)
        adptrlist.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spiner.adapter = adptrlist



    }

    private fun lstnr() {
        binding.ivSkip.setOnClickListener {
            startActivity(Intent(this, WelcomeActivity::class.java))
        }
    }

    override fun onPageScrolled(position: Int, positionOffset: Float, positionOffsetPixels: Int) {

    }

    override fun onPageSelected(position: Int) {
        
       // position == binding.tabLayout.tabCount - 1
    }

    override fun onPageScrollStateChanged(state: Int) {

    }
}