# install tensorflow docker image
docker run -it gcr.io/tensorflow/tensorflow:latest-devel
# link the image sets to docker
docker run -it -v $HOME/tf_files/:/tf_files/ gcr.io/tensorflow/tensorflow:latest-devel

cd tensorflow
# download the inception model for retrain
git pull

# retrain the model
python /tensorflow/tensorflow/examples/image_retraining/retrain.py \
--bottleneck_dir=/tf_files/bottlenecks \
--how_many_training_steps 500 \
--model_dir=/tf_files/inception \
--output_graph=/tf_files/retrained_graph.pb \
--output_labels=/tf_files/retrained_labels.txt \
--image_dir /tf_files/starwars
