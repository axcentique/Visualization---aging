DataDir='/Users/george/Desktop/Vis_aging/'

flirt -in /Users/george/Data/Art_Connect_1/444653/444653_brain -ref /usr/local/fsl/data/standard/MNI152_T1_2mm_brain -out ${DataDir}/brain_t1_in_mni -omat ${DataDir}/brain_t12mni.mat -dof 12

