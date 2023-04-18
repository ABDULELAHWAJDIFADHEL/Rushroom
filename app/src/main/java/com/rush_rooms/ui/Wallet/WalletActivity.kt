package com.rush_rooms.ui.Wallet

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.WalletAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityWalletBinding

class WalletActivity : AppCompatActivity() {
    lateinit var bin: ActivityWalletBinding
    private var adptr: WalletAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        bin = ActivityWalletBinding.inflate(layoutInflater)
        setContentView(bin.root)
        initView()
        lstnr()
    }

    private fun initView() {
        bin.addMoney.tvCommonTitle.text = getString(R.string.add_money)
        bin.walletToolbar.tvTittle.text = getString(R.string.wallet)
        bin.walletToolbar.ivSpinner.visibility = View.VISIBLE

        bin.rvWallet.layoutManager = LinearLayoutManager(this)
        adptr = WalletAdapter(this)
        bin.rvWallet.adapter = adptr
        adptr!!.notifyDataSetChanged()

    }

    private fun lstnr() {
        bin.walletToolbar.ivBack.setOnClickListener {
            finish()
        }

    }
}