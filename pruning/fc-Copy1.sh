#!/bin/bash

redundancy=5
gpu=0
lr1=0.03
lr2=0.1
hidden_size=500

for epochs in 50 100; do
    for arch in RedFourLayerFC; do
        mkdir -p "./results/${arch}"
        for sparsity in 0.3; do
            for coef in 0.1 0.15 0.2 0.3 0.5; do
                python3 main.py --gpu $gpu --lr1 $lr1 --lr2 $lr2 --epochs $epochs --arch $arch --hidden-size $hidden_size --redundancy $redundancy --sparsity $sparsity --coef $coef --freeze-weights --use-relu --save-results > "./results/${arch}/r${redundancy}_s${sparsity}_e${epochs}_h${hidden_size}_c${coef}_relu.out"
            done
        done
    done
done


