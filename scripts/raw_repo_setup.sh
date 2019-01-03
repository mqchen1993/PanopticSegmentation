#!/bin/bash

LIGHTCYAN='\033[1;36m'
NC='\033[0m'
DGREY='\033[1;30m'
WHITE='\033[1;37m'

echo -e "${WHITE}=========================================================${NC}"
echo -e "${LIGHTCYAN}Hello! I see you have cloned the panopticSegmentation repo. ${NC}"
echo -e "${WHITE}=========================================================${NC}"

sleep 3

echo -e "${LIGHTCYAN}Before we can do any inference, we need set up the repo. ${NC}"
echo -e "${WHITE}=========================================================${NC}"

sleep 3

echo -e "${LIGHTCYAN}Heres the contents: ${NC}"
echo -e " "
echo -e "${WHITE}- Download coco val2017 with annotations.${NC}"
echo -e " "
echo -e "${WHITE}- Setup MASK_RCNN${NC}"
echo -e " "
echo -e "${WHITE}- Setup DeepLabV2${NC}"
echo -e " "
echo -e "${WHITE}=========================================================${NC}"

sleep 5

echo -e "${LIGHTCYAN}Ok! Let's begin. ${NC}"
echo -e "${WHITE}=========================================================${NC}"


echo -e "${LIGHTCYAN}Downloading coco val2017 with annotations.. ${NC}"
echo -e "${WHITE}=========================================================${NC}"

sleep 2

# If dataset doesnt exist then download
if [ ! -d "dataset" ]; then
  echo -e "${LIGHTCYAN}Proceeding to download dataset... ${NC}"
  ./scripts/download_dataset.sh
fi

echo -e "${LIGHTCYAN}---Done! ${NC}"
echo -e "${WHITE}=========================================================${NC}"

sleep 1

echo -e "${LIGHTCYAN}Setup MASK_RCNN.. ${NC}"
echo -e "${WHITE}=========================================================${NC}"
mkdir weights

sleep 2

echo -e "${LIGHTCYAN}Please be paitent, this may take some time.... ${NC}"
echo -e "${WHITE}=========================================================${NC}"
sleep 0.5
echo -e "${LIGHTCYAN}Working.... ${NC}"
echo -e "${WHITE}=========================================================${NC}"

python installInstanceSegWeights.py

echo -e "${LIGHTCYAN}---Done! ${NC}"
echo -e "${WHITE}=========================================================${NC}"

sleep 1

echo -e "${LIGHTCYAN}Setup DeepLabV2${NC}"
echo -e "${WHITE}=========================================================${NC}"

./scripts/deeplab_setup.sh

echo -e "${LIGHTCYAN}---Done! ${NC}"
echo -e "${WHITE}=========================================================${NC}"

echo -e "${LIGHTCYAN}Ready to perform panoptic segmentation${NC}"
echo -e "${WHITE}=========================================================${NC}"
