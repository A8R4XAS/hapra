#!/bin/bash

#Ablauf:
#Zuerst alle Function deklarieren damit sie im späteren Verlauf gentzt werden können.
#Mit einer For-Schleife alle übergebenen Parameter der Syntaxanalysefunktion übergeben
#Nach jedem erfolgreichem Aufruf einer Funktion wird die nächste Funktion aufgerufen.
#Bis zum Schluss die Funktion für GTKWave aufgerufen wird.

#Mit dieser Funktion wird GTKWave mit den erstellten Dateien gestartet.
func_startGTKWave () {
 echo "Starting GTKWave"
 gtkwave testbench.vcd
}



#VCD-Dump
#Simuliert und startet ein Entwurf.
#Hängt mit den vorherigen Befehlen -e,-a zusammen.
func_VCDDump () {
 if ( ghdl -r $x --vcd=testbench.vcd )
 then
  echo "VCD-Dump OK"
 else
  echo "VCD-Dump Failed"
 fi
}




#Build
#Widerholt die Analyse aller Elemente, wie Konfigurationen, Einheiten, Architektur
#sowie die Deklaration der Pakete.
#Desweiteren wir eine Liste von Objekt Dateien erstellt,
#die für die ausführbare Datei benötigt werden.
#Danach werde all diese Datein mit der Laufzeit Bibliothek verknüpft.
func_build () {
 x=${1%.*} #remove the filetype
 if ( ghdl -e $x )
 then
  echo "Build OK"
  func_VCDDump
 else
  echo "Build Failed"
 fi
}




#Analyse
#Analysiert und kompiliert eine oder mehrere Dateien.
#Die Analyse aller weiteren Datein wird, bei mehreren Dateien,
#automatisch abgebrochen sobald eine Datei nicht kompiliert werden konnte.
func_analyse () {
 if ( ghdl -a $1 )
 then
  echo "Analysis OK";
  func_build $1;
 else
  echo "Analysis Failed";
 fi
}




#Syntax-Check
#Wird genutzt um den Syntax von Dateien zu prüfen da es diese anylsiert.
#Es wird kein Code generiert.
func_syntaxCheck () {
 if ( ghdl -s $1 )
 then
   echo "Syntax-check OK";
   func_analyse $1;
 else
   echo "Syntax-check Failed";
 fi
}



#param $@ := Array aller übergebener Parameter
#file 	  := Elemente im Parameter Array
#An jedem übergebenem Parameter die Funktion für den Syntax Check aufrufen
for file in $@
do
 func_syntaxCheck $file
done


#Zu aller letzt GTKWave starten
func_startGTKWave
