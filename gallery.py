import yaml
import cv2 as cv

columns = 3
gutter  = 30

def main():
    file = open('_data/log.yaml', 'r')
    dicts = yaml.load(file.read(), Loader = yaml.Loader)
    size = [ 0 for _ in range(columns) ]
    imgs = [ [] for _ in range(columns) ]
    for d in dicts:
        i = size.index(min(size))
        image = cv.imread(d['key'] + '/final.png')
        height, _ = image.shape[:2]
        size[i] = size[i] + height + gutter
        imgs[i].append(d['key'])
    for i, col in enumerate(imgs):
        print('- column:', i)
        print('  targets:')
        for img in col:
            print('    -', img)

main()
