#!/bin/sh

gpu=$(prime-select query)

if [ $gpu = intel ] ; then
	newgpu=nvidia
elif [ $gpu = nvidia ] ; then
	newgpu=intel
else
	newgpu=error
fi

if [ $newgpu = error ] ; then
	zenity --error --text="<span size=\"xx-large\"><b>Error. Could not switch NVIDIA card.</b></span>" --title="Nvidia GPU switch" --ok-label="Quit" && exit
fi

sudo prime-select $newgpu && sudo systemctl restart lightdm
