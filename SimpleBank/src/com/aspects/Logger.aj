package com.aspects;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

public aspect Logger {
	
	pointcut success() : call(* create*(..) );
    after() : success() {
    // Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario
    System.out.println("**** User created ****");
    }
    
	pointcut successTransaction() : call(* moneyMakeTransaction());
    after() : successTransaction() {
    // Aspecto transaccion: solo muestra este mensaje después de haber depositado
    System.out.println("**** Transaction completed ****");

    try{
        String ruta = "/ruta/Log.txt";
        File file = new File(ruta);

        // Crear archivo si no existe
        if (!file.exists()) {
            file.createNewFile();
        }
        
        FileWriter fw = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(fw);
        
        Calendar calendarioT = Calendar.getInstance();
      
        bw.write("DEPÓSITO DE DINERO - "+ calendarioT.get(Calendar.HOUR_OF_DAY) + ":"
        								+ calendarioT.get(Calendar.MINUTE) + ":"
        								+ calendarioT.get(Calendar.SECOND));
        bw.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    }
    
	pointcut successCash() : call(* moneyWithdrawal());
    after() : successCash() {
    // Aspecto para retiro de dinero: solo muestra este mensaje después de haber retirado dinero
    System.out.println("**** Cash removed ****");
    
    try{
        String ruta = "/ruta/Log.txt";
        File file = new File(ruta);

        // Crear archivo si no existe
        if (!file.exists()) {
            file.createNewFile();
        }
        
        FileWriter fw = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(fw);
        
        Calendar calendarioR = Calendar.getInstance();
      
        bw.write("RETIRO DE DINERO - "+ calendarioR.get(Calendar.HOUR_OF_DAY) + ":"
        								+ calendarioR.get(Calendar.MINUTE) + ":"
        								+ calendarioR.get(Calendar.SECOND));
        bw.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    }
}
