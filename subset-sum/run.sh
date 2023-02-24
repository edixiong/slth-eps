#!/bin/bash

epsilon=0.01
hidden_size=500

for p_c in 0; do
    for n in 19 20; do
        for seed in 123 1 2 3 4 5 6 7 8 9; do
            mkdir -p "./results1/${epsilon}/${p_c}/${n}"
            python main.py --seed $seed --hidden-size $hidden_size --epsilon $epsilon --model "fc2" --p_c $p_c --n $n --target-net "./weights/fc2.pt" > "./results1/${epsilon}/${p_c}/${n}/seed${seed}.out"
        done
    done
done