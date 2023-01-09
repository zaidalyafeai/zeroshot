  python run_ner.py \
      --model_name_or_path /tmp/$( echo $1 | tr '.' '_' )_train \
      --dataset_name xtreme \
      --do_eval \
      --per_device_train_batch_size 12 \
      --learning_rate 3e-5 \
      --num_train_epochs 2 \
      --output_dir /tmp/$( echo $1 | tr '.' '_' )_zero_ar \
      --dataset_config_name PAN-X.ar