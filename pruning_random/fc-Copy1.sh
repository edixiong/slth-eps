#!/bin/bash

redundancy=5
gpu=0
lr1=0.03
lr2=0.1
hidden_size=500

for epochs in 50; do
    for arch in RedFourLayerFC; do
        mkdir -p "./results/${arch}"
        for sparsity in 0 0.1 0.2 0.3 0.4; do
            for coef in 0.001 0.005 0.01 0.02 0.03 0.04 0.05 0.1 0.12 0.2 0.3 0.5; do
                python3 main.py --gpu $gpu --lr1 $lr1 --lr2 $lr2 --epochs $epochs --arch $arch --hidden-size $hidden_size --redundancy $redundancy --sparsity $sparsity --coef $coef --freeze-weights --use-relu --save-results > "./results/${arch}/r${redundancy}_s${sparsity}_e${epochs}_h${hidden_size}_c${coef}_relu.out"
                # python3 main.py --gpu $gpu --lr $lr --epochs $epochs --arch $arch --hidden-size $hidden_size --redundancy $redundancy --sparsity $sparsity --coef $coef --freeze-weights --save-results > "./results/${arch}/r${redundancy}_s${sparsity}_e${epochs}_h${hidden_size}_c${coef}.out"
            done
        done
    done
done

# for epochs in 30 50 100 125 150; do
#     for arch in WideTwoLayerFC WideFourLayerFC; do
#         mkdir -p "./results/${arch}"
#         for sparsity in 0 0.01 0.02 0.025 0.05 0.1 0.25 0.5 0.75 0.9 0.95 0.975 0.98 0.99; do
#             python3 main.py --gpu $gpu --lr $lr --epochs $epochs --arch $arch --hidden-size $hidden_size --redundancy $redundancy --sparsity $sparsity --freeze-weights --save-results > "./results/${arch}/r${redundancy}_s${sparsity}_e${epochs}_h${hidden_size}.out"
#         done
#     done
# done


