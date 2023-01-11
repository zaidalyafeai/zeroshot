train_path=xnli_$1_train
zero_path=xnli_$1_zero_ar
save_path=/content/drive/MyDrive/zeroshot/xnli

python run_ner.py \
      --model_name_or_path bert-base-multilingual-cased \
      --do_train \
      --do_eval \
      --per_device_train_batch_size 32 \
      --learning_rate 5e-5 \
      --num_train_epochs 2.0 \
      --max_seq_length 128 \
      --output_dir /tmp/$train_path \
      --language $1 \
      --save_steps -1

python run_ner.py \
      --model_name_or_path /tmp/$train_path \
      --do_eval \
      --per_device_train_batch_size 32 \
      --learning_rate 5e-5 \
      --num_train_epochs 2.0 \
      --max_seq_length 128 \
      --output_dir /tmp/$zero_path \
      --language ar \
      --save_steps -1

mkdir $save_path/$train_path
mkdir $save_path/$zero_path

cp /tmp/$train_path/all_results.json $save_path/$train_path/all_results.json
cp /tmp/$zero_path/all_results.json $save_path/$zero_path/all_results.json

rm -rf /tmp/$train_path
rm -rf /tmp/$zero_path