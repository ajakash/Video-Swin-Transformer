import torch

config_file = 'configs/recognition/tsn/tsn_r50_video_inference_1x1x3_100e_kinetics400_rgb.py'
device = 'cuda:0' # or 'cpu'
device = torch.device(device)
print(torch.cuda.is_available())
print(torch.cuda.get_device_name(0))

from mmaction.apis import init_recognizer, inference_recognizer

model = init_recognizer(config_file, device=device)
# inference the demo video
inference_recognizer(model, 'demo/demo.mp4', 'demo/label_map_k400.txt')
