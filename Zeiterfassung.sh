#!/bin/bash

wideLineStart =    "      #########################################################################"
borderLine    =    "      #                                                                       #"
wideLineEnd   =    "      #############//  Zeiterfassung v1.0-(c)RKeller  //#######################"

ipAdresses=(192.168.178.1 192.168.178.2 192.168.178.3 192.168.178.4)
ipNames=("Testperson1" "Testperson2" "Testperson3" "Testperson4")
states=(false false false false)



count = 0



for (( ; ; ))
do
  clear

  printf "Zeiterfassung läuft!\n"
  printf "Zum Abbrechen drücke STRG+C\n\n"
  cat aktuell.csv
  echo "      #########################################################################" > aktuell.csv
  echo "      #                                                                       #" >> aktuell.csv
  echo "      #                                                                       #" >> aktuell.csv
  echo "      #                    $(date)                       #" >> aktuell.csv
  echo "      #                                                                       #" >> aktuell.csv




  for ip in "${ipAdresses[@]}"
  do
  trap "clear; echo $(tput setaf 1)Zeiterfassung abgebrochen!; exit;" SIGINT SIGTERM
    ping -q -c 1 -W 1 $ip >& /dev/null
    if [ $? = 1 ]
      then
                if [ "${states[$count]}" = true ]
                  then
                    echo "$(date), $ip, ${ipNames[$count]}, Büro verlassen" >> zeiterfassung.csv
                    echo "$(date), $ip, Büro verlassen" >> "${ipNames[$count]}".csv

                  fi
                echo "                       $(tput setaf 1)${states[$count]}, $ip, ${ipNames[$count]}, abwesend$(tput sgr0)                      " >> aktuell.csv
                echo "                                                                             " >> aktuell.csv
                states[$count]=false

      else
                if [ "${states[$count]}" = false ]
                then
                  echo "$(date), $ip, ${ipNames[$count]}, Büro betreten" >> zeiterfassung2.csv
                  echo "$(date), $ip, Büro betreten" >> "${ipNames[$count]}".csv

                fi
                echo "                       $(tput setaf 2)${states[$count]}, $ip, ${ipNames[$count]}, anwesend$(tput sgr0)                     " >> aktuell.csv
                echo "                                                                             " >> aktuell.csv
                states[$count]=true

             fi
    ((count++))
  done
  echo "      #                                                                       #" >> aktuell.csv
  echo "      #                                                                       #" >> aktuell.csv
  echo "      ################//  Zeiterfassung v1.0-(c)RKeller  //####################" >> aktuell.csv

  sleep 1

  unset count
  count = 0
done
