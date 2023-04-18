package com.rush_rooms.ui.ConfrimYourMobile

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.KeyEvent
import android.view.View
import android.widget.EditText
import android.widget.Toast
import com.rush_rooms.Helper.Toaster
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityConfirmYourMobileBinding
import com.rush_rooms.ui.Login.LoginActivity
import com.rush_rooms.ui.Successfully.SuccessfullyActivity

class ConfirmYourMobileActivity : AppCompatActivity(){
    lateinit var binding: ActivityConfirmYourMobileBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityConfirmYourMobileBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.submit)

    }

    private fun lstnr() {
        binding.edittext1.addTextChangedListener(GenericTextWatcher(binding.edittext1,binding.edittext2))
        binding.edittext2.addTextChangedListener(GenericTextWatcher(binding.edittext2,binding.edittext3))
        binding.edittext3.addTextChangedListener(GenericTextWatcher(binding.edittext3,binding.edittext4))
        binding.edittext4.addTextChangedListener(GenericTextWatcher(binding.edittext4,binding.edittext5))
        binding.edittext5.addTextChangedListener(GenericTextWatcher(binding.edittext5,binding.edittext6))
        binding.edittext6.addTextChangedListener(GenericTextWatcher(binding.edittext6,null))

        binding.edittext1.setOnKeyListener(GenericKeyEvent(binding.edittext1, null))
        binding.edittext2.setOnKeyListener(GenericKeyEvent(binding.edittext2, binding.edittext1))
        binding.edittext3.setOnKeyListener(GenericKeyEvent(binding.edittext3, binding.edittext2))
        binding.edittext4.setOnKeyListener(GenericKeyEvent(binding.edittext4,binding.edittext3))
        binding.edittext5.setOnKeyListener(GenericKeyEvent(binding.edittext5,binding.edittext4))
        binding.edittext6.setOnKeyListener(GenericKeyEvent(binding.edittext6,binding.edittext5))
        binding.ivBack.setOnClickListener {
            onBackPressed()
        }
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(
                Intent(
                    this,
                    SuccessfullyActivity::class.java
                ).setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK)
            )
            finish()
        }


    }
    class GenericKeyEvent internal constructor(private val currentView: EditText, private val previousView: EditText?) : View.OnKeyListener{
        override fun onKey(p0: View?, keyCode: Int, event: KeyEvent?): Boolean {
            if(event!!.action == KeyEvent.ACTION_DOWN && keyCode == KeyEvent.KEYCODE_DEL && currentView.id != R.id.edittext1 && currentView.text.isEmpty()) {
                //If current is empty then previous EditText's number will also be deleted
                previousView!!.text = null
                previousView.requestFocus()
                currentView!!.setBackgroundResource(R.drawable.edittext_dsgn)
                previousView!!.setBackgroundResource(R.drawable.edittext_dsgn)
                return true
            }
            return false
        }


    }

    inner class GenericTextWatcher(private val currentView: View, private val nextView: View?) :
        TextWatcher {
        override fun afterTextChanged(editable: Editable) { // TODO Auto-generated method stub
            val text = editable.toString()
            when (currentView.id) {
                R.id.edittext1 -> if (text.length == 1)
                {
                    nextView!!.requestFocus()
                    binding.edittext1.setBackgroundResource(R.drawable.otp_edit_txt_dsgn)
                }
                R.id.edittext2 -> if (text.length == 1)
                {
                    nextView!!.requestFocus()
                    binding.edittext2.setBackgroundResource(R.drawable.otp_edit_txt_dsgn)
                }
                R.id.edittext3 -> if (text.length == 1)
                {
                    nextView!!.requestFocus()
                    binding.edittext3.setBackgroundResource(R.drawable.otp_edit_txt_dsgn)
                }
                R.id.edittext4 -> if (text.length == 1)
                {
                    nextView!!.requestFocus()
                    binding.edittext4.setBackgroundResource(R.drawable.otp_edit_txt_dsgn)
                }
                R.id.edittext5 -> if (text.length == 1)
                {
                    nextView!!.requestFocus()
                    binding.edittext5.setBackgroundResource(R.drawable.otp_edit_txt_dsgn)
                }
                R.id.edittext6 -> if (text.length == 1)
                {
                    binding.edittext6.setBackgroundResource(R.drawable.otp_edit_txt_dsgn)
                }
            }
        }
        override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
        }

        override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
        }
    }


}