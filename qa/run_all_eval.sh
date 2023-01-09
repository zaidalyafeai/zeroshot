python run_qa.py \
    --model_name_or_path /tmp/$1_train \
    --dataset_name Zaid/xquad_ar \
    --do_eval \
    --per_device_train_batch_size 12 \
    --learning_rate 3e-5 \
    --num_train_epochs 2 \
    --max_seq_length 384 \
    --doc_stride 128 \
    --output_dir /tmp/$1_zero_ar