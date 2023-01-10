train_path=$( echo $1 | tr '.' '_' )_train
zero_path=$( echo $1 | tr '.' '_' )_zero_ar
save_path=/content/drive/MyDrive/zeroshot

python run_ner.py \
      --model_name_or_path bert-base-multilingual-cased \
      --dataset_name xtreme \
      --do_train \
      --do_eval \
      --per_device_train_batch_size 12 \
      --learning_rate 3e-5 \
      --num_train_epochs 2 \
      --output_dir /tmp/$train_path \
      --dataset_config_name $1

python run_ner.py \
      --model_name_or_path /tmp/$train_path \
      --dataset_name xtreme \
      --do_eval \
      --per_device_train_batch_size 12 \
      --learning_rate 3e-5 \
      --num_train_epochs 2 \
      --output_dir /tmp/$zero_path \
      --dataset_config_name PAN-X.ar

mkdir $save_path/$train_path
mkdir $save_path/$zero_path

cp /tmp/$train_path/all_results.json $save_path/$train_path/all_results.json
cp /tmp/$zero_path/all_results.json $save_path/$zero_path/all_results.json

rm -rf /tmp/$train_path
rm -rf /tmp/$zero_path