#!/bin/sh

#  func2t1.sh

SUBJ="444653"
DataDir="/Users/george/Desktop/fMRI/Art_Connect_1/"${SUBJ}
T1=${SUBJ}"_brain"
func=${SUBJ}"_rest_filt_all"
OutDir="/Users/george/Desktop/Vis_aging"


#register anatomical to motion corrected fMRI data
flirt -in ${DataDir}/${T1} -ref ${DataDir}/${func} -out ${DataDir}/${func}_ANAT2 -omat ${DataDir}/struc2func.mat -dof 12

#apply registration matrix to functional data
convert_xfm -omat ${DataDir}/func2struc.mat -inverse ${DataDir}/struc2func.mat

for S in {'L','R'}
do
    for V in {1..47}
    do
        flirt -in ${OutDir}/${SUBJ}_${S}_`printf %04d ${V%.*}`.nii.gz -ref ${DataDir}/${T1} -out ${OutDir}/${SUBJ}_${S}_`printf %04d ${V%.*}`_struc -init ${DataDir}/func2struc.mat  -applyxfm
        echo ${V}`printf \r`
    done
done