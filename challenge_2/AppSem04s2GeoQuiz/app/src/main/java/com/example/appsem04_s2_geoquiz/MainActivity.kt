package com.example.appsem04_s2_geoquiz

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import java.util.logging.Level

class MainActivity : AppCompatActivity() {
    lateinit var questions:ArrayList<Question>
    var position = 0
    var points = 0
    var level = 1
    var lives = 3

    var recordPuntos = 0
    var recordNivel = 1
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadQuestions()
        setupViews()
    }
    private fun loadQuestions(){
        questions=ArrayList()
        questions.add(Question("Es Buenos Aires capital de Argentina", true))
        questions.add(Question("Es Lima capital de Perú", true))
        questions.add(Question("Es Bogotá capital de Colombia", true))
        questions.add(Question("Es Caracas capital de Venezuela", true))
        questions.add(Question("Es Quito capital de Ecuador", true))
        questions.add(Question("Es Lima capital de Bolivia", false))
        questions.add(Question("Es Santiago capital de Chile", true))
        questions.add(Question("Es Bogota capital de Paraguay", false))
        questions.add(Question("Es Montevideo capital de Uruguay", true))
        questions.add(Question("Es San Salvador capital de El Salvador", true))
        questions.add(Question("Es Guatemala capital de Guatemala", true))
        questions.add(Question("Es Tegucigalpa capital de Honduras", true))
        questions.add(Question("Es San José capital de Costa Rica", true))
        questions.add(Question("Es Managua capital de Nicaragua", true))
        questions.add(Question("Es Panamá capital de Panamá", true))
        questions.add(Question("Es La Habana capital de Cuba", true))
        questions.add(Question("Es Santo Domingo capital de República Dominicana", true))

    }

    private fun setupViews() {
        val btSi = findViewById<Button>(R.id.btSi)
        val btNo = findViewById<Button>(R.id.btNo)
        val tvQuestion = findViewById<TextView>(R.id.tvQuestion)
        val tvLvl = findViewById<TextView>(R.id.tvLvl)
        val tvPoints = findViewById<TextView>(R.id.tvPoints)
        val btReset = findViewById<Button>(R.id.btReset)
        val tvCorazon = findViewById<TextView>(R.id.tvCorazon)
        val tvRecordNum = findViewById<TextView>(R.id.tvRecordNum)
        val tvRecordPuntNum = findViewById<TextView>(R.id.tvRecordPuntNum)
        btSi.setOnClickListener {
            if (questions[position].answer)
            {
                Toast.makeText(this, "Correcto", Toast.LENGTH_SHORT).show()
                points+=10
                tvPoints.text = points.toString()
                position++
                level++
                tvLvl.text = level.toString()
                if (position == questions.size)
                    position = 0
                tvQuestion.text = questions[position].sentence
            }
            else
            {
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_SHORT).show()
                position++
                if (position == questions.size)
                    position = 0
                tvQuestion.text = questions[position].sentence

                level++
                tvLvl.text = level.toString()
                lives--
                if (lives == 0)
                {
                    Toast.makeText(this, "Perdiste", Toast.LENGTH_SHORT).show()
                    if (recordNivel<level)
                        recordNivel = level
                    if (recordPuntos<points)
                        recordPuntos = points
                    tvRecordNum.text = recordNivel.toString()
                    tvRecordPuntNum.text = recordPuntos.toString()
                    position = 0
                    points = 0
                    lives = 3
                    level = 1
                    tvPoints.text = points.toString()
                    tvQuestion.text = questions[position].sentence
                    tvLvl.text = level.toString()
                }
                tvCorazon.text = ""
                for (i in 1..lives)
                {
                    tvCorazon.text = tvCorazon.text.toString() + "❤"
                }
            }
        }
        btNo.setOnClickListener {
            if (!questions[position].answer){
                Toast.makeText(this, "Correcto", Toast.LENGTH_SHORT).show()
                points+=10
                tvPoints.text = points.toString()
                position++
                level++
                tvLvl.text = level.toString()
                if (position == questions.size)
                    position = 0
                tvQuestion.text = questions[position].sentence
            }
            else{
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_SHORT).show()
                position++
                if (position == questions.size)
                    position = 0
                tvQuestion.text = questions[position].sentence
                level++
                tvLvl.text = level.toString()
                lives--
                if (lives == 0)
                {
                    Toast.makeText(this, "Perdiste", Toast.LENGTH_SHORT).show()
                    if (recordNivel<level)
                        recordNivel = level
                    if (recordPuntos<points)
                        recordPuntos = points
                    tvRecordNum.text = recordNivel.toString()
                    tvRecordPuntNum.text = recordPuntos.toString()
                    position = 0
                    points = 0
                    lives = 3
                    level = 1
                    tvPoints.text = points.toString()
                    tvQuestion.text = questions[position].sentence
                    tvLvl.text = level.toString()

                }
                tvCorazon.text = ""
                for (i in 1..lives)
                {
                    tvCorazon.text = tvCorazon.text.toString() + "❤"
                }
            }
        }


        btReset.setOnClickListener {
            position = 0
            points = 0
            lives = 3
            level = 1
            tvLvl.text = level.toString()
            tvCorazon.text = ""
            for (i in 1..lives)
            {
                tvCorazon.text = tvCorazon.text.toString() + "❤"
            }
            tvPoints.text = points.toString()
            tvQuestion.text = questions[position].sentence
        }

        for (i in 1..lives)
        {
            tvCorazon.text = tvCorazon.text.toString() + "❤"
        }

        tvQuestion.text = questions[position].sentence
    }
}