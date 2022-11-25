#!/bin/bash -ex                                       
                                                      
PREFIX_DIR=$1                                         
if [[ -z $PREFIX_DIR ]]; then                         
        PREFIX_DIR="${HOME}/.local"                   
fi                                                    
                                                      
CMAKE_VERSION='3.15.7'                                
CMAKE_NAME="cmake-${CMAKE_VERSION}"                   
BASE_DIR=$(dirname $(realpath ${0}))                  
WORKING_DIR=${BASE_DIR}/working                       
                                                      
mkdir ${WORKING_DIR}                                  
                                                      
pushd ${WORKING_DIR}                                  
                                                      
git clone https://github.com/Kitware/CMake.git        
pushd CMake                                           
git checkout "v3.15.7"                                
                                                      
./configure --prefix=${PREFIX_DIR}                    
make && make install                                  
                                                      
popd                                                  
                                                      
popd                                                  
                                                      
if [[ -n ${WORKING_DIR} ]]; then                      
        rm -rf ${WORKING_DIR}                         
fi                                                    
