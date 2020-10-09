#!/usr/bin/env bash
CUDA_VISIBLE_DEVICES=0
python examples/StackPointerParser.py --mode FastLSTM --num_epochs 200 --batch_size 32 --decoder_input_size 768 --hidden_size 768 --encoder_layers 3 --decoder_layers 1 \
 --pos_dim 100 --char_dim 100 --num_filters 100 --arc_space 512 --type_space 128 \
 --opt adam --learning_rate 0.00002 --decay_rate 0.8 --epsilon 1e-4 --coverage 0.0 --gamma 0.01 --clip 1.0 \
 --schedule 13 --double_schedule_decay 5 --max_decay 9 \
 --p_in 0.33 --p_out 0.33 --p_rnn 0.33 0.33 --unk_replace 0.5 --label_smooth 1.0 --beam 10 --prior_order inside_out \
 --grandPar --sibling \
 --elmo_path "elmo/model" --elmo_dim 2048 \
 --word_embedding NNLM --word_path "data/embedding/NNLM_clean.txt" --char_embedding random \
 --punctuation '.' '``' "''" ':' ',' \
 --train "data/sejong/train.conllx" \
 --dev "data/sejong/test.conllx" \
 --model_path "models/parsing/stack_ptr/" --model_version 164ed6 --model_name 'network.pt' \
 --pos_embedding 4 --pos_path "data/embedding/14_skipgram_100.vec" \
 --bert --bert_path "bert/" --bert_feature_dim 1600 \
 --etri_train "data/etri_data/etri.train.conllx" --etri_dev "data/etri_data/etri.dev.conllx"