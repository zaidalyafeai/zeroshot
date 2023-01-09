python run_ner.py \
    --model_name_or_path bert-base-multilingual-cased \
    --dataset_name xtreme \
    --do_train \
    --do_eval \
    --per_device_train_batch_size 12 \
    --learning_rate 3e-5 \
    --num_train_epochs 2 \
    --output_dir /tmp/$1_train \
    --config_name $1