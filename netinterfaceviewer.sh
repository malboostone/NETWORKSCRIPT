#!/bin/bash
#########################################################
#							#
# --------------- FAIT PAR MRMALBOOSTONE ---------------#
#							#
#							#
#    &&&&&  &&&&&  &&&&&&  &  &&&&&   &&&&&&&&		#
#    &	    &      &    &  &  &    &     & 		#
#    &&&&&  &      &&&&&   &  &&&&&      &		#
#        &  &      &  &    &  &          &		#
#    &&&&&  &&&&&  &    &  &  &          &	&é...   #
#							#
#							#
#########################################################

#Afficher la configuration réseau
clear
echo -e "\e[31m"
echo "------------------------------------NET INTERFACE VIEWER--------------------------------------"
echo -e "\e[0m"
read -rp "Quel est l'interface réseau que vous souhaitez consulter ?  " saisi
while [[ "$saisi" =~ [^[:alnum:]] ]]
do
		clear
		echo -e "\e[31m"
		echo "------------------------------------NET INTERFACE VIEWER--------------------------------------"
		echo "Veuillez ne pas saisir de caractère non alphanumérique"
		echo -e "\e[0m"
		read -rp "Quel est l'interface réseau que vous souhaitez consulter ?  " saisi
		test -e /etc/sysconfig/network-scripts/ifcfg-$saisi
		while [ "$?" = "1" ]
		do
			clear
			echo -e "\e[31m"
			echo "------------------------------------NET INTERFACE VIEWER--------------------------------------"
			echo "L'interface saisie n'existe pas, veuillez saisir une interface valide"
			echo -e "\e[0m"
			read -rp "Quel est l'interface réseau que vous souhaitez consulter ?  " saisi
		done
done
test -e /etc/sysconfig/network-scripts/ifcfg-$saisi
while [ "$?" = "1" ]
do
		clear
		echo -e "\e[31m"
		echo "------------------------------------NET INTERFACE VIEWER--------------------------------------"
		echo "L'interface saisie n'existe pas, veuillez saisir une interface valide"
		echo -e "\e[0m"
		read -p "Quel est l'interface réseau que vous souhaitez consulter ?  " saisi
		test -e /etc/sysconfig/network-scripts/ifcfg-$saisi
		while [[ "$saisi" =~ [^[:alnum:]] ]]
		do
			clear
			echo -e "\e[31m"
			echo "------------------------------------NET INTERFACE VIEWER--------------------------------------"
			echo "Veuillez ne pas saisir de caractère non alphanumérique"
			echo -e "\e[0m"
			read -rp "Quel est l'interface réseau que vous souhaitez consulter ?  " saisi
		done
		test -e /etc/sysconfig/network-scripts/ifcfg-$saisi
done
clear
echo -e "\e[31m"
echo "------------------------------------NET INTERFACE VIEWER--------------------------------------"
echo -e "\e[0m"
echo "Configuration réseau de l'interface : $saisi"
echo
temporaire="$(ifconfig $saisi)"
resultat="${temporaire/$saisi:/}"
echo -e "$resultat"
echo -e "\e[31m"
echo "----------------------------------------------------------------------------------------"
echo -e "\e[0m"
