package com.aspects;
import java.io.File;
import java.util.Calendar;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Date;


public aspect Logger {
	    File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	    java.util.Date fecha = new Date();
	    BufferedWriter bw;
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success1() : call( * money*(..) );
	    after() : success1() { 
	    	try {
	            if (!file.exists()) {
	                file.createNewFile();
	            }
	            FileWriter fw = new FileWriter(file,true);
	            BufferedWriter bw = new BufferedWriter(fw);
	            if (thisJoinPointStaticPart.getSignature().getName().equals("moneyMakeTransaction")) {
	            System.out.println("Realizar Transaccion " + fecha);
	            bw.write("Realizar Transaccion " + fecha + " \n");
	            }
	            else {
		            System.out.println("Retirar Dinero " + fecha);
		            bw.write("Retirar Dinero " + fecha + " \n");
		            }bw.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	}